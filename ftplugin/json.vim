"let g:vim_json_syntax_conceal = 0

" 2 space tabbing
setlocal sw=2 sts=2 et

com! FormatJSON %!python -m json.tool
