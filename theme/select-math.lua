-- Select one math header without merging two include-in-header arrays.
function Meta(meta)
  if meta["offline-standalone"] then
    quarto.doc.include_file("in-header", "math-newcm-standalone.html")
  elseif meta["math-font"] and pandoc.utils.stringify(meta["math-font"]) == "fira" then
    quarto.doc.include_file("in-header", "math-fira.html")
  else
    quarto.doc.include_file("in-header", "math-newcm.html")
  end
  return meta
end
