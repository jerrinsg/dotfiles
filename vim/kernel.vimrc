set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

" This was added because backspace was not deleting any characters
set backspace=indent,eol,start
set smarttab " make <tab> and <backspace> smarter
set autoindent " turn on auto/smart indenting
set smartindent

" Turn on line numbers
set number 

" Added for pathogen installation: https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Solarized coor scheme settings
" What is the difference between syntax enable and syntax on?
 "syntax enable
 "set background=dark
 "colorscheme solarized
 "se t_Co=16
"let g:solarized_termcolors = 256  " New line!!

" Handle common Vim command errors
cabbrev Q quit
cabbrev Qa qa
cabbrev QA qa
cabbrev W write
cabbrev Wa wa
cabbrev Wq wq
cabbrev Wqa wqa
cabbrev WQ wq
"cabbrev TList Tlist

" Highlight search results, toggle between highligh
" http://vim.wikia.com/wiki/VimTip14
:set hlsearch
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

"To always display the status line 
set laststatus=2

" Make Vim jump to the last position when reopening a file
if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Enabling undo across sessions
set undofile                " Save undo's after file closes
set undodir=/root/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" When searching for a word using "*' key, do not jump to the next occurence of the word
"nnoremap * :keepjumps normal! mi*`i<CR>
:nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>


" Press Return to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Return> :nohlsearch<Bar>:echo<CR>

" Enable taglist by pressing F9
nnoremap <silent> <F9> :TlistToggle<CR>
let Tlist_WinWidth = 35 

" Open a file in read mode if it is already opened
autocmd SwapExists * let v:swapchoice = "o"

" Warn when text exceeds 80 characters
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Split on the right side always
set splitright
