set nocompatible              " be iMproved, required
filetype off                  " required

set timeoutlen=1000

set ttimeoutlen=0

highlight Visual cterm=reverse ctermbg=NONE
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Activate syntax highlighting
syntax on

" Make backspace work as normal.
set backspace=indent,eol,start

" Tell vim to hide instead of close buffers.
set hidden

" Highlight all search matches.
set hlsearch

" Set the number of visual spaces per tab.
set tabstop=2

" Set the number of spaces per tab when editing.
set softtabstop=2

" Let the tab key insert spaces instead.
set expandtab

" Set the number of spaces when indenting.
set shiftwidth=2

" Match the indentation from the previous line.
set autoindent

" Search as characters are entered.
set incsearch

" Case-insensitive search.
set ignorecase

" If you search with all lowercase letters, the search will be case-
" insensitive.  If you use any capitals, the search will be case-sensitive.
set smartcase

" Highlight the current line by default.
set cursorline

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Python editing
:au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set autoindent |
    \ set fileformat=unix

:au BufNewFile,BufRead *.cpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" LaTeX
:au BufNewFile,BufRead *.tex
	\ colorscheme  vimbrant|
	\	setlocal nocursorline |
  \ :NoMatchParen



" Set the highlight to be a white background.
"hi CursorLine   cterm=NONE ctermbg=white
"hi CursorColumn cterm=NONE ctermbg=white

" Press \l to toggle highlighting the current line, and \c to toggle
" highlighting the current column.
nnoremap <Leader>l :set cursorline!<CR>
nnoremap <Leader>c :set cursorcolumn!<CR>

" Press f to move forward to the next space in the line.  Press F to move
" backward to the previous space in the line.
nnoremap f f<space>
nnoremap F F<space>

" Press F2 to switch to paste mode, such that autoindent will be ignored when
" pasting in text.
inoremap <expr> <tab> ((getline('.')[:col('.')-2]=~'\S')?("\<C-v>\t"):(repeat(' ', &ts-((virtcol('.')-1)%&ts))))

set pastetoggle=<F2>

" Toggle spell-checking with F4.
if has("spell")
  map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
endif

" Open new split panes to the right and bottom, instead of to the left and
" top.
set splitbelow
set splitright

" Word-wrap lines after 79 characters as you type.

set textwidth=80
set formatoptions+=t
set textwidth=79
"autocmd BufNewFile,BufRead * setlocal formatoptions+=t

" Highlight portions of lines that are too long to encourage better
" line-breaking.  Toggle highlighting on and off with \o.
highlight Overlength ctermbg=lightred
highlight ClearHighlight ctermbg=none
let s:overlengthActivated = 1
match Overlength /\%>79v.\+/
function! ToggleOverlengthHighlight()
  if s:overlengthActivated == 0
    let s:overlengthActivated = 1
    match Overlength /\%>79v.\+/
  else
    let s:overlengthActivated = 0
    match ClearHighlight /\%>79v.\+/
  endif
endfunction
nnoremap <Leader>o :call ToggleOverlengthHighlight()<CR>

" Jump to the 80th column.
nnoremap <Leader>e :cal cursor(0, 80)<CR>

set wildmenu
set showmatch
set nu
set paste
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
:map j gj
:map k gk
colorscheme monokai
" For gitgutter
set updatetime=100

" For filename at top of tap
:set showtabline=2

" For airline
let g:airline_theme='dark'
let g:vimtex_compiler_latexmk = {'callback' : 0}
"let g:vimtex_complete_enabled=1
" LaTeX Stuff
let g:vimtex_fold_enabled = 1
:set paste
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"let g:vimtex_view_method='zathura'
"set conceallevel=1
"let g:tex_conceal='abdmg'
" put \begin{} \end{} tags tags around the current word
map  <C-B>      YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA
map! <C-B> <ESC>YpkI\begin{<ESC>A}<ESC>jI\end{<ESC>A}<esc>kA
"let g:livepreview_previewer = 'Skim'
" autocmd VimEnter * AirlineToggleWhitespace

" NERDTree
" au VimEnter *  NERDTree
" Plugins
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'itchyny/lightline.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'lervag/vimtex'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'kmszk/skyhawk'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'mbbill/undotree'
Plugin 'luochen1990/rainbow'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-latex/vim-latex'
