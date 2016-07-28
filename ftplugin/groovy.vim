
if has('nvim')
    " Dispatch code execution
    nnoremap <Leader>rg :<C-U>terminal groovy '<C-R>=expand("%:p") <CR>'<CR>
    nnoremap <Leader>rr :<C-U>terminal ~/.vim/grails-gradle-test.sh '<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>rb :<C-U>terminal ~/.vim/grails-gradle-build.sh '<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>rn :<C-U>terminal gradle codenarcMain<CR>
    nnoremap <Leader>gr :<C-U>terminal gradle run<CR>
    nnoremap <Leader>gb :<C-U>terminal gradle build<CR>
    " Maven test tasks
    nnoremap <Leader>mr :<C-U>terminal mvn test -Dtest='<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>mt :<C-U>terminal mvn test<CR>
else
    " Dispatch code execution
    nnoremap <Leader>rg :<C-U>Dispatch groovy '<C-R>=expand("%:p") <CR>'<CR>
    nnoremap <Leader>rr :<C-U>Dispatch ~/.vim/grails-gradle-test.sh '<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>rb :<C-U>Dispatch ~/.vim/grails-gradle-build.sh '<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>rn :<C-U>Dispatch gradle codenarcMain<CR>
    nnoremap <Leader>gr :<C-U>Dispatch gradle run<CR>
    nnoremap <Leader>gb :<C-U>Dispatch gradle build<CR>
    " Maven test tasks
    nnoremap <Leader>mr :<C-U>Dispatch mvn test -Dtest='<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>mt :<C-U>Dispatch mvn test<CR>
endif

" Jump to Spec file
nnoremap <Leader>ts :<C-U>tag <C-R>=expand("%:t:r") <CR>Spec<CR>
nnoremap <Leader>vs :<C-U>tag <C-R>=expand("<cword>") <CR>Spec<CR>
"noremap <Leader>vr :<C-U>find **/build/reports/tests/**/*.<C-R>=expand("%:t:r") <CR>.html<CR>

" Grails stuff
"noremap <Leader>rt :<C-U>Dispatch grails test-app -Duser.timezone=UTC unit: '<C-R>=expand("%:t:r") <CR>'<CR>
"noremap <Leader>rr :<C-U>Dispatch grails test-app -Duser.timezone=UTC integration: '<C-R>=expand("%:t:r") <CR>'<CR>

" Groovy / Java find uses
nnoremap <Leader>fu :<C-U>grep --include '*.groovy' --include '*.gsp' --include '*.java' --include '*.gradle' -rE "\<<C-R>=expand("<cword>") <CR>\>" .<CR>:copen<CR>

