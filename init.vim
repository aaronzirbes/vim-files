" Aaron's Global Defaults

" Bundle Plugins!
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let g:goldenview__enable_default_mapping = 0

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Vundle stuff
Bundle 'kien/ctrlp.vim'
Bundle 'aaronzirbes/grails-vim.git'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'gregsexton/gitv'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'freitass/todo.txt-vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'sjurgemeyer/vimport'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-dispatch'
Bundle 'radenling/vim-dispatch-neovim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/Align.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
Bundle 'zhaocai/GoldenView.Vim'
Bundle 'blindFS/vim-taskwarrior'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'udalov/kotlin-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Requires:
"https://github.com/editorconfig/editorconfig-core-c

" Occasional Plugins
" Bundle 'jplaut/vim-arduino-ino'
" Bundle 'powerman/vim-plugin-AnsiEsc'
" Bundle 'chrisbra/csv.vim'

"Bundle 'scrooloose/syntastic'

" After updating this list, run `nvim +BundleInstall +qall`
" After updating this list, run `nvim +PluginInstall +qall`

"let g:vim_arduino_library_path = /Applications/Arduino.app/Contents/Java
"let g:vim_arduino_serial_port = /my/serial/port
"
let g:airline_theme='tomorrow'

" Enables HTML/CSS syntax highlighting in your JavaScript file.
"set javascript_enable_domhtmlcss

" Status line
"set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" Syntastic syntax checking
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"%{fugitive#statusline()} to 'statusline'

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Experimenting
Bundle 'Kapeli/dash.vim'

" Maybe plugins
" Bundle 'derekwyatt/vim-scala'
" Bundle 'mhinz/vim-startify'
" Bundle 'jeetsukumaran/vim-buffergator.git'
" Bundle 'sjl/gundo.vim.git'


" tagbar support for groovy
 let g:tagbar_type_groovy = {
 \ 'ctagstype' : 'groovy',
 \ 'kinds' : [
     \ 'p:package',
     \ 'c:class',
     \ 'i:interface',
     \ 'f:function',
     \ 'v:variables',
     \ ]
 \ }


filetype plugin indent on

" I like pretty colors
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Ctrl-P ignore path
set wildignore+=*.class,.git,.hg,.svn,**/target/classes/**,**/target/test-classes/**,**/target/test-reports/**.html,**/target/test-reports/**.xml,**/build/**
let g:ctrlp_cmd = 'CtrlPTag'
nnoremap <C-i> :<C-U>CtrlP <CR>

" Tabline support for airline
let g:airline#extensions#tabline#enabled = 1

" Exhuberant C-Tags
set tags=.tags

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
"set ignorecase smartcase    " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)
" Set the current line with the cursor on it to have an underline
set cursorline
set cmdheight=2
" When switching buffers, swap for the current open window
"set switchbuf=useopen
"
" Turn on line numbers
set number
set numberwidth=5

" Always show cursor information
set ruler

" Whether or not to show the tabs list
"set showtabline=2

" COMMENT THESE OUT TO LET VIM WINDOWS BE THE DEFAULT SIZE
"if has("gui_macvim")
  "set winwidth=121
  "set winminwidth=12
  "set winheight=25
  "set winminheight=15
  "au VimEnter * set winheight=999
"endif

"set errorformat=%A""%f: %l"" : %m,%+G%.%#
set errorformat=%A""%f: %l"" : %m,%+%.%#

" The number of lines before and after the cursor to show
set scrolloff=3

let mapleader=","

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Search highlighting
set hlsearch
function! MapCr()
    nnoremap \ :nohlsearch<CR>
endfunction
call MapCr()

" my settings
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
set background=dark
"set background=light
"



"colorscheme torte
"colorscheme koehler
"colorscheme solarized
colorscheme Tomorrow-Night
"colorscheme Tomorrow

" destroy all trailing whitespace
autocmd BufWritePre *.groovy :%s/\s\+$//e

" Vertical Column Limiter
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%121v.\+/
set colorcolumn=121
highlight ColorColumn ctermbg=2

" ctags
command! Tag :call GenerateCTags()
function! GenerateCTags()
    let file = expand("%:p:h")
    execute ":!ctags -f " . file . "/.tags " . file . "/*"
endfunction

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Split line
nnoremap L i<CR><Esc>

" Vim JDK Imports location
let g:vimport_filetype_import_files = {
        \ 'java': [$HOME . '/.vim/data/vimports_java.txt'],
        \ 'groovy': [$HOME . '/.vim/data/vimports_java.txt', $HOME . '/.vim/data/vimports_groovy.txt', $HOME . '/.vim/data/vimports_spock.txt' ],
        \ 'kotlin': [$HOME . '/.vim/data/vimports_kotlin.txt'],
        \ 'scala': []
    \ }

let g:vimport_lookup_gradle_classpath=1
noremap <Leader>i :InsertImport <CR> :%s/  *$// <CR>

" vimdiff ignore whitespace
set diffopt+=iwhite

" Fugitive
noremap <Leader>b :<C-U>Gblame<CR>
noremap <Leader>di :<C-U>Gdiff<CR>
noremap <Leader>dd :<C-U>Gvsplit develop:<C-R>=expand("%")<CR><CR>
noremap <Leader>s :<C-U>Gstatus<CR><C-W>20+
noremap <Leader>h :<C-U>Gbrowse<CR>
vnoremap <Leader>h :<C-U>Gbrowse<CR>
noremap <Leader>c :<C-U>Gcommit<CR>
noremap <Leader>d :<C-U>Gdiff<CR>
" GitV
noremap <Leader>l :<C-U>Gitv!<CR>
noremap <Leader>L :<C-U>Gitv<CR>
" NerdTree
let g:NERDTreeWinSize = 40
noremap <Leader>nt :<C-U>NERDTreeToggle<CR>
noremap <Leader>nf :<C-U>NERDTreeFind<CR>

noremap :StacktraceFromJson :<C-U>%s#\\n\\t#\r\t#g<CR>

" tagbar
noremap <Leader>t :<C-U>TagbarToggle<CR>
noremap <Leader>tb :<C-U>!ctags -R<CR>
" Jira https://gist.github.com/2d860441b323e543d2bc

" Tired of hitting shift
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Really not a big fan of trailing whitespace, mark it red
set list listchars=tab:>-,trail:·,precedes:<,extends:>

noremap <Leader>hr <C-U>set nolist

" clean stacktraces
nnoremap <Leader>st :<C-U>g/^\tat.*\.java.*/d<CR>:<C-U>g/^\tat.*(Unknown Source).*/d<CR>:<C-U>g/^\tat.*(Native Method).*/d<CR>
"noremap <Leader>st :<C-U>g/^\tat .*\(\.java:[0-9]\+\\|(Native Method)\\|(Unknown Source)\).*/d<CR>

" Dash lookup word under cursor
noremap <Leader>jd :<C-U>Dash! <C-R>=expand("<cword>") <CR><CR>

" JIRA
noremap <Leader>j :<C-U>!jira<CR> <CR>

" Enable Spell check highlighting for buffer
noremap <Leader>sc :<C-U>set spell spelllang=en_us<CR>
noremap <Leader>sn :<C-U>set spell spelllang=<CR>

" Copy selected range to Mac OS X copy buffer
vnoremap <Leader>y :<C-U>!sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p '<C-R>=expand("%:p") <CR>' \|pbcopy <CR> <CR>
" Copy entire file contents to Mac OS X copy buffer
nnoremap <Leader>y :<C-U>!cat '<C-R>=expand("%:p") <CR>' \| pbcopy <CR> <CR>

" Navigate next buffer / previous buffer
nnoremap <C-n> :<C-U>bn<CR>
nnoremap <C-N> :<C-U>bn<CR>
nnoremap <C-b> :<C-U>bp<CR>
nnoremap <C-B> :<C-U>bp<CR>

" Window navigation
if has('nvim')
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l

    nnoremap <C-h> <C-w>h
    nnoremap <BS> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

else
    nnoremap <C-j> <C-w>j
    nnoremap <C-J> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-K> <C-w>k
    nnoremap <C-l> <C-w>l
    nnoremap <C-L> <C-w>l
    nnoremap <C-h> <C-w>h
    nnoremap <C-H> <C-w>h
endif

" Window resizing
nnoremap <C-7> :resize +2
nnoremap <C-8> :vertical:resize +2
nnoremap <C-9> :vertical:resize -2
nnoremap <C-0> :resize +2

" JSON highlighting
au BufRead,BufNewFile *.json set filetype=json

