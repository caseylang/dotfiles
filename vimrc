call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
colorscheme molokai
set t_Co=256
filetype on

" Allows me to enter my vimrc file while in vim
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" Shows line numbers
set number

"Turns off compatibility for vi
set nocompatible

set hidden

"Switchs tabs to spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set autoindent
set smartindent
map <S-Enter> O<Esc>
map <CR> o<Esc>
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W><bar>
map <C-H> <C-W>h<C-W><bar>
set fileformats=unix,dos

" Enables the mouse
set mouse=a

" Makes search case insensitive, but only when I search all lower case
set ignorecase
set smartcase

" Highlights search results and clear with ,<space>
set showmatch
set hlsearch

nnoremap <leader><space> :noh<cr>

" Indicates which mode you're in 
set showmode

"No more fucking bell
set visualbell

"Faster scrolling
set ttyfast

" Not sure what this does yet.
set showcmd
set cursorline
"set ruler

" Makes it so wrapped line movement isn't retarded
nnoremap j gj
nnoremap k gk

" Wildmenu?
set wildmenu
set wildmode=list:longest

" Sets softwrapping
set wrap linebreak textwidth=0

" Sources the vimrc file on write
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd FileType php DoMatchParen
  autocmd FileType php hi MatchParen ctermbg=blue guibg=lightblue
endif
