# Subvisual — Build what comes next

A browser presentation for leaders building and scaling live products in fintech, crypto and complex software. Built from Subvisual’s supplied 2026 Pitch deck, current website and documented case accounts.

## Present

Open `index.html` in a browser, or run a local static server from this folder. All fonts, logos and product images are included and work offline. Booking, email and source links need a connection.

- 11 main slides, approximately 9½ minutes of speaker notes.
- 3 supporting slides: Venture, capabilities and practical partnership questions.
- Arrow keys, on-screen arrows, slide dots and horizontal swipes navigate.
- Tall slides scroll vertically on phones. Home and End jump to the first and last slides.
- Speaker guidance and source references remain in the editable source; the presentation has no utility buttons.
- The final sales slide is slide 11. Slides 12–14 are optional supporting detail.
- The cover has a slowly rotating orbital sculpture with a subtle breathing rhythm, orbiting points and smooth pointer response. The headline, label and branding remain still. Motion stops off-slide or in a hidden tab; reduced-motion preferences show a static artwork, and touch gestures remain available for navigation.
- Slide 11 has a right-side “Trusted by” panel with two slow, seamless logo rows and no pause/stop button. Hovering over the panel pauses the rows; reduced-motion preferences show all logos in a static grid. Motion pauses when the slide is inactive, and the panel stacks below the call to action on phones.

## Selected portfolio

1. Remote — embedded engineering for global payroll.
2. Qonto — customer authentication work and a documented 2021 launch.
3. Tesser — product and engineering across stablecoin payment infrastructure.
4. Utrust — crypto payments and a team able to operate independently.
5. Coverflex — an early MVP and marketing website, with a client testimonial.

The original deck’s longer portfolio and leadership chronology were condensed. The narrative prioritises the buyer’s delivery needs, tailored engagement, five cases and a clear intro action. The grilling decisions confirmed a sales deck, leaders scaling live products and use of documented milestones. The overview and every case header use sourced company logos with accessible company-name alternatives.

## Evidence and imagery

The closing panel combines the five portfolio logos with the six exact assets from Subvisual’s homepage: AT&T, Protocol Labs, Uphold, Brazos Safety Systems, Orki and Quill Finance. Their original files are unchanged; only the closing panel applies a muted grayscale presentation treatment. Additional provenance is recorded in `media/logos/trusted-sources.json`.

Each slide includes source references in the editable source. Product imagery provenance is recorded in `media/cases/sources.json`. The supplied Pitch deck is the primary account of Subvisual’s specific Remote and Tesser work. Remote and Coverflex images illustrate their current products, not specific screens delivered by Subvisual. Utrust’s source-deck imagery carries the successor xMoney brand.

Portfolio figures are reported by Subvisual; client fundraising and exits are not represented as results caused by Subvisual. No unverified performance improvements, delivery durations, “world’s first” or exclusivity claims were added.

The Qonto case is intentionally limited to customer authentication. Gabriel Poça’s [firsthand account](https://gabrielpoca.com/now/) documents his 2021 build-and-launch contribution; [Qonto’s June 2021 announcement](https://qonto.com/en/blog/qonto/security/online-payment-is-even-more-secure) corroborates the phone-verification launch; [Subvisual’s client listing](https://luma.com/zobkbey5) confirms the relationship. No claim is made to Qonto’s whole platform, separate 3DS2 work, regulatory certification or quantified security gains. The Qonto photograph is current product context. Logo provenance is recorded in `media/logos/sources.json`.

The visual system uses Subvisual blue #045CFC as an accent, indigo #2421AB for dark panels and a pale #F7F7F8 stage. Fraunces and Inter are included under their open font licences in `media/fonts/`. The cover line artwork is original SVG; the brand’s licensed stock illustrations and paid fonts were not redistributed.

## Edit

The presentation began as a copy of the requested skill’s `deck-template.html`. The `DECK` object in `index.html` contains the full slide sequence, speaker notes and source keys. The bundled navigation engine remains the foundation; custom renderers provide the portfolio and editorial layouts.

## Verified

The cover-motion revision passed 169 browser checks on 9 September 2026 across 1920×1080, 1440×900, 1120×800, 800×800, 640×900, 375×812 and 375×500. These covered all 14 slides’ horizontal layout, sampled orbital geometry through a full 72-second rotation, caption/brand clearance, pointer tilt and reset, touch handling, off-slide suspension, keyboard/swipe navigation, short-phone scrolling, removal of the closing-panel button and loading of all 11 trusted logos. The actual reduced-motion CSS rules were applied in the test preview to verify the static artwork and logo grid. Desktop and phone artwork and the closing panel were visually checked; the live deck reported no browser errors.

The earlier animated closing-panel revision passed 161 browser checks across 1920×1080, 1440×900, 1120×800, 800×800, 640×900, 375×812 and 375×500. These covered all 14 slides’ horizontal layout, placement of the new panel, all 11 unique company logos, loop coverage, movement, its then-present pause/resume control, off-slide pause and the reduced-motion static layout. A fresh browser session reported no errors. Desktop, phone and static fallback layouts were also visually inspected. Earlier portfolio/case logo sizes remain unchanged.

Following visual feedback, company logos were reduced to supporting-label scale (64–92px wide, 17–25px high), with a compact three-column portfolio grid and smaller case badges. The overview and Qonto case were rechecked at 1470×659 and 375×812; all five logos load, the mobile overview has no horizontal overflow, and no breakpoint enlarges the marks.

The current 14-slide logo/Qonto revision passed 96 browser checks on 9 September 2026 across 1440×900, 1120×800, 640×900, 375×812 and 375×500. The checks covered every slide’s horizontal overflow and heading clearance, reachable slide tops, all five overview and case logos, removal of the earlier controls, jump links, navigation boundaries, keyboard navigation, swipe direction and vertical scrolling. A fresh browser session reported no errors. The overview and all five case slides received visual review, with additional phone views of the overview and Qonto. Company wordmarks are optically sized without altering their shapes; Utrust uses its authentic historical logo, while the xMoney product imagery remains clearly identified.

The original 15-slide version was verified in Chrome on 9 September 2026 at 1440×900, 1120×800, 640×900, 375×812 and 375×500, with 87 layout and interaction checks and a desktop visual review.

The shortened 13-slide revision was rechecked on the same day: the four remapped jump links reach their intended slides, all four case slides and images remain, the requested buttons and footnote are absent, and no browser errors were reported. The cover and track-record slide received a fresh visual check at 1470×659. The “Senior judgment / Shared ownership” and “Each week, something moves” slides were removed because their content overlapped with the retained partnership, capabilities and getting-started slides.

## Publish

Approved publication address: [Subvisual deck](https://blendediam.github.io/subvisual-deck/).

`deploy.sh` is included from the presentation skill and prepared for GitHub Pages. Publishing creates a public repository and makes all deck files, imagery and notes publicly accessible. Public publication at this address was explicitly approved on 9 September 2026.

To publish or update this deck after authenticating the GitHub CLI, run `bash deploy.sh subvisual-deck` from this folder. The script refuses to overwrite an existing remote repository unless this folder is already connected to that exact repository.
