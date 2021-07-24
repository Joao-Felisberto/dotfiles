"set background=dark
"let g:gruvbox_contrast_dark = 'medium'
"colorscheme gruvbox 

"colorscheme nord
colorscheme elflord

"colorscheme PaperColor
syntax on

set nu rnu

set scrolloff=999

filetype plugin on

set tabstop=4
set shiftwidth=4
" set expandtab " converts tabs into spaces

" For easy movement in file
"inoremap <C-e> <C-o>$
"inoremap <C-a> <C-o>0

"nnoremap <silent> <C-Right> <c-w>l
"nnoremap <silent> <C-Left> <c-w>h
"nnoremap <silent> <C-Up> <c-w>k
"nnoremap <silent> <C-Down> <c-w>j

map [1;5D <C-Left>
map [1;5C <C-Right>
"map [1;5D b
"map [1;5C e
map [1;5A <C-Up>
map [1;5B <C-Down>
map! [1;5D <C-Left>
map! [1;5C <C-Right>
"map! [1;5D b
"map! [1;5C e
map! [1;5A <C-Up>
map! [1;5B <C-Down>

noremap <silent> J 10j
noremap <silent> K 10k

au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4

syntax on
au BufRead,BufNewFile *.g4 set filetype=antlr4
