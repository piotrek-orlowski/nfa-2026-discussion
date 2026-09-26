-- Keep TeX intact while bypassing Quarto's legacy Reveal MathJax plugin.
-- Scoped to optional MathJax 4 profiles; the default deck uses its own renderer.
local function escape_html(text)
  return text:gsub('&', '&amp;'):gsub('<', '&lt;'):gsub('>', '&gt;')
end

function Math(element)
  local display = element.mathtype == 'DisplayMath'
  local opening = display and '\\[' or '\\('
  local closing = display and '\\]' or '\\)'
  local kind = display and 'display' or 'inline'
  return pandoc.RawInline('html', '<span class="math ' .. kind .. '">'
    .. opening .. escape_html(element.text) .. closing .. '</span>')
end
