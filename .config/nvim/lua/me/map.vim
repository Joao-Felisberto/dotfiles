" Leader key
let mapleader = " "

" NERDTree Toggle
nnoremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> <C-o>:NERDTreeToggle<CR>

" Go to previous/next buffer
nnoremap <C-h> :b<CR>
nnoremap <C-l> :e<CR>

" Move cursor in insert mode
inoremap <C-h> <C-Left>
inoremap <C-l> <C-Right>
inoremap <C-k> <C-Up>
inoremap <C-j> <C-Down>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j

" Scroll 10 lines
nnoremap J 10j
nnoremap K 10k

" NERDCommenter Toggle
nnoremap <leader>c <plug>NERDCommenterToggle
vnoremap <leader>c <plug>NERDCommenterToggle

" Telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>
