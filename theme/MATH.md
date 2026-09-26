# Mathematics

**New Computer Modern is the default mathematics font** for every deck in this
project. MathJax 4 renders it as SVG without changing the animation scripts.
The `sans` profile changes text headings to Visby CF; mathematics remains NewCM.

Run from `slides/quarto`:

```sh
quarto render cireq-2026.qmd --no-execute
quarto render cireq-2026.qmd --profile sans --output-dir _output-sans --no-execute
```

Use separate `--output-dir` directories for comparisons so generated shared
assets cannot overwrite each other. Use `--profile math-fira` only to request
the former Fira renderer for an ordinary directory-backed build. A one-file
build remains NewCM because its SVG glyphs can be embedded without webfonts.

| Option | Character | Suggested pairing |
| --- | --- | --- |
| Default | NewCM with Visby Slab headings | Legible equations with distinctive headings |
| `sans` | NewCM with Visby CF headings | Simpler text headings for projection |
| `math-fira` | Fira Math | Compatibility option for ordinary builds |

This pairing is a design judgment, not an HEC brand requirement. Check lowercase
Latin, Greek, calligraphic and bold symbols at presentation size before choosing.

Neo Euler was also explored as a rounded, upright match for Visby Slab. The
current MathJax documentation describes an Euler font extension, but the pinned
4.0.0 engine does not implement `fontExtensions`. A browser probe confirmed that
such a configuration silently retained New Computer Modern glyphs and did not
request Euler data. An Euler profile is therefore not supplied. It would require
a separate engine upgrade and regression check.

## Integration

Quarto 1.8.27's Reveal template selects a legacy MathJax plugin. The shared
configuration bypasses that plugin using `html-math-method: plain` and a small Lua
filter, `math-preserve.lua`, that preserves original TeX and delimiters in HTML.
The configuration places this filter after `quarto`, so it also sees math generated
by animation shortcodes. This ordering is essential: plain output alone can
convert or damage math source. The filter also escapes HTML-sensitive
characters. Existing raw HTML math and animation layers pass through unchanged.

Ordinary builds load MathJax 4.0.0's `tex-svg.js` and its local NewCM dynamic
tables. They retain the HTML TeX extension, so semantic `\class{...}` wrappers
continue to carry the deck's attention colors. The standalone header embeds the
same NewCM SVG tables and suppresses worker-backed features. Reveal runs layout
again after asynchronous typesetting. No animation script, timeline, fragment
number or stylesheet is replaced.

The directory travel package loads the version-pinned MathJax 4 runtime and NewCM
tables entirely from local vendored assets, and Reveal Chalkboard remains enabled.
The one-file builds embed the NewCM SVG tables directly. Neither artifact
requires a warm browser cache. HEC text fonts and the logo are also local assets.

## Verification

Both `cireq-2026.qmd` and `cireq-2026-18.qmd` render with NewCM SVG math through
Quarto 1.8.27. Browser verification covers representative semantic colors,
conditioning equations, and both animated equation layers, including Back.

## Primary references

- [MathJax font support](https://docs.mathjax.org/en/latest/output/fonts.html)
  describes the available fonts and asynchronous loading. This documentation
  tracks the latest release; not every option exists in the pinned 4.0.0 engine.
- [Quarto project profiles](https://quarto.org/docs/projects/profiles.html)
  documents profile selection and combination.
