#!/usr/bin/env bash
# Publish a self-contained deck folder to GitHub Pages.
# Creates a PUBLIC repo, pushes this folder, enables Pages, and verifies the
# live URL (and one media file) return 200. Run from inside the deck folder:
#   bash deploy.sh                 # repo name = current folder name
#   bash deploy.sh my-talk-2025    # ...or pass a name
set -euo pipefail

cd "$(dirname "$0")"
REPO_NAME="${1:-$(basename "$PWD")}"

# --- checks -----------------------------------------------------------------
command -v git >/dev/null || { echo "git not found. Install git first."; exit 1; }
command -v gh  >/dev/null || { echo "GitHub CLI (gh) not found. Install: https://cli.github.com  then run: gh auth login"; exit 1; }
gh auth status >/dev/null 2>&1 || { echo "Not logged in. Run: gh auth login"; exit 1; }
OWNER="$(gh api user -q .login)"

# A new deck must never be pushed into an unrelated existing repository.
if gh repo view "$OWNER/$REPO_NAME" >/dev/null 2>&1; then
  CURRENT_ORIGIN="$(git -C . remote get-url origin 2>/dev/null || true)"
  if [ ! -d .git ] || { [ "$CURRENT_ORIGIN" != "https://github.com/$OWNER/$REPO_NAME.git" ] && [ "$CURRENT_ORIGIN" != "git@github.com:$OWNER/$REPO_NAME.git" ]; }; then
    echo "Repository $OWNER/$REPO_NAME already exists and is not this deck's remote. Choose a unique repository name."
    exit 1
  fi
fi

# --- warn about size (GitHub: 100 MB/file hard limit, ~1 GB Pages soft cap) --
BIG="$(find . -type f -size +100M -not -path './.git/*' 2>/dev/null || true)"
if [ -n "$BIG" ]; then
  echo "!! These files are over GitHub's 100 MB per-file limit and will be rejected:"
  echo "$BIG"
  echo "   Compress them (see references/media.md) or host the media elsewhere. Aborting."
  exit 1
fi

# --- commit -----------------------------------------------------------------
if [ ! -d .git ]; then git init -q; fi
[ -f .nojekyll ] || touch .nojekyll   # serve files as-is (no Jekyll processing)
git add -A
if git diff --cached --quiet; then
  echo "(nothing new to commit)"
else
  git commit -q -m "Publish deck: $REPO_NAME"
fi
git branch -M main

# --- create public repo + push ----------------------------------------------
if gh repo view "$OWNER/$REPO_NAME" >/dev/null 2>&1; then
  echo "Repo $OWNER/$REPO_NAME already exists — pushing to it."
  git remote add origin "https://github.com/$OWNER/$REPO_NAME.git" 2>/dev/null || true
  git push -u origin main
else
  gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
fi

# --- enable Pages (main branch, root) ---------------------------------------
gh api -X POST "repos/$OWNER/$REPO_NAME/pages" \
  -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1 \
  && echo "Pages enabled." \
  || echo "Pages may already be enabled (or needs the UI: Settings > Pages > Branch: main / root)."

URL="https://$OWNER.github.io/$REPO_NAME/"

# --- verify it went live (first build can take ~1 min) ----------------------
echo "Waiting for $URL to go live..."
for i in $(seq 1 20); do
  CODE="$(curl -s -o /dev/null -w '%{http_code}' "$URL" || echo 000)"
  [ "$CODE" = "200" ] && break
  sleep 6
done
echo "index.html -> HTTP $CODE"

MEDIA="$(find media segments -type f 2>/dev/null | head -1 || true)"
if [ -n "$MEDIA" ]; then
  MCODE="$(curl -s -o /dev/null -w '%{http_code}' "$URL$MEDIA" || echo 000)"
  MTYPE="$(curl -sI "$URL$MEDIA" | tr -d '\r' | awk -F': ' 'tolower($1)=="content-type"{print $2}')"
  echo "$MEDIA -> HTTP $MCODE  ($MTYPE)"
fi

if [ "$CODE" != "200" ]; then
  echo "Pages has not returned HTTP 200 yet. Check the deployment at https://github.com/$OWNER/$REPO_NAME/actions"
  exit 1
fi
echo
echo "Live at:  $URL"
