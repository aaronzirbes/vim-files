" Aaron's Global Defaults


" Bundle Plugins!
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'aaronzirbes/grails-vim.git'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/ZoomWin'
Bundle 'scrooloose/nerdtree'

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

" TagBar
nmap <F8> :TagbarToggle<CR>

" Ctrl-P ignore path
set wildignore+=*.class,.git,.hg,.svn,test-integration/**,test-unit/**,**/target/classes/**,**/target/test-classes/**,**/target/test-reports/**.xml

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
"%{fugitive#statusline()} to 'statusline'

" Whether or not to show the tabs list
"set showtabline=2

" The magic minum witdth of columns for the current window
"set winwidth=79
"
" COMMENT THESE OUT TO LET VIM WINDOWS BE THE DEFAULT SIZE
set winwidth=160
set winminwidth=12
set winheight=25
set winminheight=5
au VimEnter * set winheight=999

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
    nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCr()

" My Settings
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
colorscheme torte

" ctags
command! Tag :call GenerateCTags()
function! GenerateCTags() 
	let file = expand("%:p:h")
	execute ":!ctags -f " . file . "/.tags " . file . "/*"
endfunction

" Mercurial Diff => <Leader>b
noremap <Leader>b :<C-U>Gblame<CR>
noremap <Leader>s :<C-U>Gstatus<CR><C-W>20+
noremap <Leader>l :<C-U>Glog<CR>
noremap <Leader>h :<C-U>Gbrowse<CR>
noremap <Leader>c :<C-U>Gcommit<CR>
noremap <Leader>t :<C-U>NERDTreeToggle<CR>
noremap <Leader>f :<C-U>NERDTreeFind<CR>

