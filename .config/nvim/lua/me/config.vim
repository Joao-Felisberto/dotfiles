" https://builtin.com/software-engineering-perspectives/neovim-configuration
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " paste with middle-click 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like tab completions
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set nu rnu

syntax on                   " syntax highlighting

filetype plugin indent on   "allow auto-indenting depending on file type
filetype plugin on

colorscheme grim
