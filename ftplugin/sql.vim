" SQL Specific settings

setlocal sw=2 sts=2 et

" Don't show with overflow column
setlocal colorcolumn=

autocmd Filetype qf setlocal nowrap
autocmd Filetype qf setlocal colorcolumn=

" Run SQL selection against vagrant MySQL
vnoremap <Leader>rv :<C-U>Dispatch sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p '<C-R>=expand("%:p") <CR>' \|~/bin/sql-exec-vagrant.sh vagrant - <CR>
" Run SQL selection against local MySQL
vnoremap <Leader>rl :<C-U>Dispatch sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p '<C-R>=expand("%:p") <CR>' \|~/bin/sql-exec-vagrant.sh local - <CR>

" Run SQL file against
nnoremap <Leader>rv :<C-U>Dispatch ~/bin/sql-exec-vagrant.sh vagrant '<C-R>=expand("%:p") <CR>'<CR>
" Run SQL file against
nnoremap <Leader>rl :<C-U>Dispatch ~/bin/sql-exec-vagrant.sh local '<C-R>=expand("%:p") <CR>'<CR>

