set commentstring=%%s

function! g:OpenPDF()
  execute "!zathura" expand("%:r") . ".pdf &"
endfunction

noremap gop :call OpenPDF()<CR>
