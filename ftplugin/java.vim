
" Maven test tasks

nnoremap <Leader>rr :<C-U>Dispatch ~/.vim/grails-gradle-test.sh '<C-R>=expand("%:t:r") <CR>'<CR>
nnoremap <Leader>rb :<C-U>Dispatch ~/.vim/grails-gradle-build.sh '<C-R>=expand("%:t:r") <CR>'<CR>
nnoremap <Leader>gr :<C-U>Dispatch gradle run<CR>
nnoremap <Leader>gb :<C-U>Dispatch gradle build<CR>
nnoremap <Leader>mt :<C-U>Dispatch mvn test<CR>

nnoremap <Leader>ts :<C-U>tag <C-R>=expand("%:t:r") <CR>Spec<CR>
nnoremap <Leader>vs :<C-U>tag <C-R>=expand("<cword>") <CR>Spec<CR>

nnoremap <Leader>fu :<C-U>grep --include '*.groovy' --include '*.gsp' --include '*.java' --include '*.gradle' -rE "\<<C-R>=expand("<cword>") <CR>\>" .<CR>:copen<CR>
