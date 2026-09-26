// The preceding, embedded NewCM scripts registered every dynamic SVG table.
// Mark them loaded so MathJax never asks asyncLoad to fetch them again.
const NewCMFont = MathJax._.output.fonts['mathjax-newcm'].svg_ts.MathJaxNewcmFont
for (const dynamic of Object.values(NewCMFont.dynamicFiles)) {
  dynamic.promise = Promise.resolve()
}
