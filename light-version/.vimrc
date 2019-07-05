" basic {{
set number
set ruler
set showcmd
set nobackup
set noswapfile
set cursorline
set autoindent
set cindent
set smarttab
set expandtab
set smartindent
set wildmenu
set hlsearch
set nowrap
set guifont=monaco
set encoding=utf-8
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set history=1000
" }}
" leader {{
let mapleader=","
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
nmap <leader>q1 :q!<CR>
nmap <leader>wq :wq<CR>
nmap <leader>y "+y
nmap <leader>p "+p
nmap <space> :
nmap <C-l> :noh<CR>
"buffer
nmap <leader><Tab> :bn<CR>
"strip all trailing whitespace in the current file
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
" }}


" hightlight
syntax enable
syntax on

" color
" airline can be display when set this
set t_Co=256
set laststatus=2
set background=dark
" colorscheme onedark
let g:onedark_termcolors=256
" color molokai

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" compile and run {{
map <F9> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ -std=c++11 % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'python'
        :!python %
    endif
endfunc
" }}
