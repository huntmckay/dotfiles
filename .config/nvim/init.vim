syntax enable           " enable syntax processing
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set rnu                 " show line numbers
set nu                  " show current line number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent levels
set autowrite
let mapleader=","       " leader is comma
set ts=4 sts=4 sw=4 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
nnoremap <space> za
inoremap jk <esc>

nnoremap <leader>n :bn<CR>
nnoremap <leader>b :bp<CR>
nnoremap <leader>l :bl<CR>
nnoremap <leader>d :bd<CR>
