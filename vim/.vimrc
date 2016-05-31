" tabs settings compatible with kernel coding style
" use tabs, not spaces
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
" end tab settings

" Added for pathogen installation
execute pathogen#infect()
syntax on
filetype plugin indent on
" End of pathogen installation

" Highlighting leading and trailing whitespaces
" Press \wn to match, \wf to clear
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:nnoremap <Leader>wn :match ExtraWhitespace /^\s* \s*\<Bar>\s\+$/<CR>
:nnoremap <Leader>wf :match<CR>
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" End highlight match


"solarized colour settings
syntax enable
set background=dark
se t_Co=16
"let g:solarized_termcolors=256
colorscheme solarized
"end solarized

" settings mainly from http://www.jukie.net/bart/blog/vim-and-linux-coding-style
"set autoindent smartindent              " turn on auto/smart indenting
set smarttab                            " make <tab> and <backspace> smarter
set backspace=eol,start,indent          " allow backspacing over indent, eol, & start
" end settings from website

" Highlight search results, toggle between highligh
" taken from http://vim.wikia.com/wiki/VimTip14
:set hlsearch
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
" end highlight
" press return to temporarily get out of the highlighted search.
:nnoremap <CR> :nohlsearch<CR><CR>

" Pressing F8 will highlight all occurrences of the current word:
":nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" This can be achieved by pressing * key

" Hide code by folding it based on {} blocks
" set foldmethod=syntax

" Turn on line numbers
set number 

"To always display the status line 
set laststatus=2

" If helptags are not generated for a plugin, run the following command
" :Helptags

" AIRLINE CONFIGURATIONS
" Stop whitespace detection
let g:airline#extensions#whitespace#enabled = 0
let g:Powerline_symbols = "fancy"

" Enable taglist by pressing F9
nnoremap <silent> <F9> :TlistToggle<CR>
let Tlist_WinWidth = 35  

" Enabling mouse in vim
":set mouse=a

" Highlight current line; Toggle with \c
" Colors do not look good; hence commenting it out
" :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:set cursorline
:nnoremap <Leader>l :set cursorline! <CR>

" Nerdtree
map <F10> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
 

" Handling common spelling errors
cabbrev Q quit
cabbrev Qa qa
cabbrev QA qa
cabbrev W write
cabbrev Wa wa
cabbrev Wq wq
cabbrev WQ wq
cabbrev TList Tlist
" End spelling tweaks

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Enabling undo across sessions
set undofile                " Save undo's after file closes
set undodir=/home/jerrin/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Make taglist refresh faster; when in insert mode, update taglist when cursor
" moves
" CHANGED TO REFRESH TAGLIST all the time; check effect on performance
" autocmd CursorMovedI * silent! TlistHighlightTag
autocmd CursorMoved * silent! TlistHighlightTag


" Highlight word; do not jump
nnoremap * :keepjumps normal! mi*`i<CR>

" Press <F2> to save a session; <F3> to reopen previous session
map <F2> :mksession! ~/.vim/vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim/vim_session <cr>     " And load session with F3
