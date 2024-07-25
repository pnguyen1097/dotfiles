" Custom foldtext to align the line counts to the right
function! ShortFoldText()
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let gutter_width = &foldcolumn + &number * &numberwidth

  " Get the first line
  let first_line = substitute(getline(v:foldstart), '{{{\s*$', '', '') . " "
  " Remove the marker if that is the fold method
  if &foldmethod == "marker"
    let first_line = substitute(first_line, '{{{\s*$', '', '') . " "
  endif

  let line_count = v:foldend - v:foldstart + 1
  let line_count_str = " (" . line_count . " lines) "

  let fill_width = winwidth(0) - gutter_width - strlen(first_line) - strlen(line_count_str) - 1
  let fill = repeat(foldchar, fill_width)

  return first_line . fill . line_count_str
endfunction
