" 2 space tabbing
setlocal sw=2 sts=2 et

" Groovy / Java find uses
nnoremap <Leader>fu :<C-U>grep --include '*.groovy' --include '*.gsp' --include '*.java' --include '*.gradle' -rE "\<<C-R>=expand("<cword>") <CR>\>" .<CR>:copen<CR>
