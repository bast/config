execute pathogen#infect()

set smartcase
set ignorecase
set nofoldenable

" https://github.com/ntpeters/vim-better-whitespace
highlight ExtraWhitespace ctermbg=blue

" https://github.com/tpope/vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" https://github.com/preservim/nerdtree
map <C-n> :NERDTreeToggle<CR>

set expandtab
set softtabstop=4
set tabstop=4

" spell checker always on when editing git commit message
autocmd FileType gitcommit setlocal spell
