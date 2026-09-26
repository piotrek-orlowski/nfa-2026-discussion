# Vendored MathJax runtime

The directory presentation vendors these exact npm releases:

- `mathjax@4.0.0`, npm tarball SHA-256
  `56fc233d745e887349a8af9cb3c6cfc2280e169a98c3853578b83049d16b272a`;
- `@mathjax/mathjax-fira-font@4.0.0`, npm tarball SHA-256
  `f2d144cbcea5b32e067998585301ff3e0b90227a33aae68948038ea82c45a62f`;
- `@mathjax/mathjax-newcm-font@4.0.0`, npm tarball SHA-256
  `7818eecfd7612e0965b60b754ab75e21cd8c0ce03ccc681910fe172b28747432`.

They were obtained with:

```sh
npm pack mathjax@4.0.0 @mathjax/mathjax-fira-font@4.0.0 \
  @mathjax/mathjax-newcm-font@4.0.0
```

`vendor/mathjax/` contains the complete packaged MathJax component tree so lazy
TeX and accessibility requests stay local. `vendor/mathjax-fonts/` contains the
Fira CHTML browser subset: `chtml.js`, `chtml/dynamic/`, and `chtml/woff2/`.
It also contains the complete 40-file NewCM `svg/dynamic/` browser subset, plus
that package's metadata. All three packages declare the Apache License 2.0. The
upstream MathJax license text is retained as `LICENSE` in each vendored package
directory.

Ordinary and single-file builds use the same local `mathjax@4.0.0` package's
bundled `tex-svg.js` component and NewCM font. Ordinary builds load the NewCM
dynamic tables locally as needed. In one-file builds those tables are explicit
script resources, so Quarto embeds them alongside the combined component.
`theme/math-newcm-dynamic-ready.js` then registers all 40 tables as already
loaded before MathJax typesets the page. The Fira package remains vendored for
the optional compatibility profile.
