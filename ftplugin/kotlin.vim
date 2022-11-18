
if has('nvim')
    nnoremap <Leader>rr :<C-U>split<CR> <C-W>j :<C-U>terminal ~/.vim/gradle-test.sh '<C-R>=expand("%:t:r") <CR>'<CR> <C-\><C-n><C-w>k

    " Dispatch code execution
    nnoremap <Leader>rg :<C-U>Dispatch groovy '<C-R>=expand("%:p") <CR>'<CR>
    nnoremap <Leader>rn :<C-U>Dispatch gradle codenarcMain codenarcTest<CR>
    nnoremap <Leader>rr :<C-U>Dispatch ~/.vim/gradle-test.sh '<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>gb :<C-U>Dispatch ~/.vim/gradle.sh build '<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>gr :<C-U>Dispatch ~/.vim/gradle.sh run '<C-R>=expand("%:t:r") <CR>'<CR>
else
    " Dispatch code execution
    nnoremap <Leader>rg :<C-U>Dispatch groovy '<C-R>=expand("%:p") <CR>'<CR>
    nnoremap <Leader>rn :<C-U>Dispatch gradle codenarcMain codenarcTest<CR>
    nnoremap <Leader>rr :<C-U>Dispatch ~/.vim/gradle-test.sh '<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>gb :<C-U>Dispatch ~/.vim/gradle.sh build '<C-R>=expand("%:t:r") <CR>'<CR>
    nnoremap <Leader>gr :<C-U>Dispatch ~/.vim/gradle.sh run '<C-R>=expand("%:t:r") <CR>'<CR>
endif

" Jump to Spec file
nnoremap <Leader>ts :<C-U>tag <C-R>=expand("%:t:r") <CR>Spec<CR>
nnoremap <Leader>vs :<C-U>tag <C-R>=expand("<cword>") <CR>Spec<CR>
"noremap <Leader>vr :<C-U>find **/build/reports/tests/**/*.<C-R>=expand("%:t:r") <CR>.html<CR>

" JVM find uses
nnoremap <Leader>fu :<C-U>grep --include '*.groovy' --include '*.gsp' --include '*.java' --include '*.kt' --include '*.gradle' -rE "\<<C-R>=expand("<cword>") <CR>\>" .<CR>:copen<CR>

nnoremap <Leader>gm :Neomake! gradleCompile<CR>


