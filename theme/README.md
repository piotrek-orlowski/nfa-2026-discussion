# HEC Montréal slide theme

The default theme uses **Visby Slab CF DemiBold** for titles and main headings,
and **Visby CF Medium** for body text. Mathematics uses **New Computer Modern** by default.
Subheadings use Visby CF. The body remains
30 px on the existing 1280 × 780 canvas. Use the sans profile when projection
conditions or a dense deck call for simpler headings. The sans profile changes
only text headings; it retains NewCM.

Run from `slides/quarto`:

```sh
quarto preview theme-preview.qmd
quarto render cireq-2026.qmd
quarto render cireq-2026.qmd --profile sans
```

Profiles write the usual output file. To retain both versions, add
`--output-dir _output-sans` to the second render. Separate output directories
keep each variant's compiled stylesheets; distinct HTML filenames alone share
the same support directory and can overwrite its resources. The switch happens at build
time and adds no presentation scripts. See [MATH.md](MATH.md) for the default
math configuration and compatibility profile.

The palette follows HEC's [brand guidelines](https://marque.hec.ca/normes/logo/):
navy `#002855`, blue `#0072ce`, cyan `#00aec7`, grey `#d9d9d6`, and white.
Navy carries text; cyan provides a restrained accent rather than small text.
The original blue square logo appears once at the upper right of every slide,
including the title slide, at its original ratio. Quarto's native `logo` option
provides it; the theme sizes it from 40 to 64 px with the viewport. The slide
number and section indicator remain at the bottom.

A thin, muted navy frame marks the actual slide canvas and scales with it.
It overlays the canvas without changing content placement, clipping overflow,
or intercepting clicks. The frame is hidden in overview and printed output.

`hec.scss` is the final visual layer after `custom.scss`. It changes typography,
colors and title metadata styling. It does not change the existing content
column widths, gaps, padding, fragment visibility, animation timing, equation
positioning, or tooltip scripts. The beat rule changes from blue to navy when
settled. The existing opacity transition remains intact.

The title partial pairs each author with their affiliation. Use structured
`author` entries with `name` and `affiliations`, and optional top-level
`presenter: "Name"` for the presentation credit. Plain author strings and
legacy `institute` metadata remain supported by Quarto's author normalization.

The optional `.hec-kicker` and `.hec-lead` classes create a small section label
and a larger statement. They add no slide-wide layout rules. The preview deck
includes full-width text, 50/50 and 52/44 columns, math, both existing animation
shortcodes, and the beat/mathstack pattern.

Section dividers use a large navy heading, a short cyan rule, and a quiet cue:

```markdown
## Estimation {.section-divider}

::: {.section-kicker}
03
:::

::: {.section-cue}
Represent the policies. Estimate the correction.
:::
```

The theme also styles Quarto's native level-one section title slides. The
section heading supplies the navigation label; add `data-section-label="Short
label"` to the divider attributes for an optional shorter label. Before the
native slide number, `section-progress.html` shows the current section and the
content slide's position within it, for example `Estimation 2/5`. Dividers show
only the section label. Title and introductory slides have no section context.
Counts exclude dividers and fragments, and restart at each section. Long labels
truncate to fit; when the centered footer leaves too little space, navigation
moves onto a row above it. The native number remains a slide link.

Fonts are loaded from `fonts.css`, whose relative paths remain valid in rendered
decks. Quarto copies the stylesheet, WOFF2 files and logo into the output. These
font files were served publicly by HEC's brand site and are included for this
institutional presentation; they are **not represented as open-source fonts**.
Consult [asset sources](assets/SOURCES.md) for provenance and the applicable
HEC guidance before reusing or distributing them elsewhere. Math font assets
have their own provenance documented separately.

There is no runtime Google Fonts import. Directory and one-file builds use local
Visby files and vendored MathJax 4 with NewCM SVG math. The feature-complete
travel artifacts retain Reveal Chalkboard; see [MATH.md](MATH.md).
