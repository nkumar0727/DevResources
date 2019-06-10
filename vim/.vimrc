set nocompatible
" filetype off
" filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'dracula/vim'
"Plugin 'rust-lang/rust.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'alvan/vim-closetag'
 Plugin 'vim-airline/vim-airline'
 Plugin 'scrooloose/nerdcommenter'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'gmarik/Vundle.vim'
 Plugin 'scrooloose/nerdtree'
 Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'tpope/vim-fugitive'

call vundle#end()

"filetype plugin indent on
"colorscheme Benokai 
"set t_Co=256
 colorscheme evening
"colorscheme dracula

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave *.* mkview
"   autocmd BufWinEnter *.* silent! loadview
" augroup END

" tabs
nnoremap F gt 
nnoremap P gT
" " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
"
" " " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
"
" " " Align line-wise comment delimiters flush left instead of following code
" " indentation
    let g:NERDDefaultAlign = 'left'
"
" " " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1

" " " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " " Allow commenting and inverting empty lines (useful when commenting a
" " region)
   let g:NERDCommentEmptyLines = 1
"
" " " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

 nmap // <leader>c<space>
 vmap // <leader>cs

  let g:nerdtree_tabs_open_on_console_startup=0
  let g:nerdtree_tabs_open_on_new_tab=1
  let g:nerdtree_tabs_synchronize_view=1
  let g:nerdtree_tabs_synchronize_focus=1
  let g:nerdtree_tabs_focus_on_files=0
  map <C-n> :NERDTreeToggle<CR>
"
" "airline
let g:airline_extensions = []
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
 let g:airline#extensions#tabline#formatter = 'default'

" set foldnestmax=10
" set nofoldenable
" set foldmethod=indent
" set foldlevelstart=20
" set foldlevel=99
nnoremap <space> za

set number
set cmdheight=1
set ruler
set wildmenu
set hlsearch
set backspace=indent,eol,start
set autoindent
set laststatus=2
set confirm
set showmatch
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab


set hidden
set textwidth=80
set wrapmargin=0
set colorcolumn=+1 

inoremap jj <Esc> 

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
 

inoremap        (  ()<Left>
inoremap        [  []<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> " strpart(getline("."), col(".")-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>


nmap <Tab> i <Space><Space><Esc>
