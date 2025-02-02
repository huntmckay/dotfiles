syntax enable           " enable syntax processing
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set rnu                 " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent levels
let mapleader=","       " leader is comma
nnoremap <space> za
inoremap jk <esc>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>n :bn<enter>
nnoremap <leader>b :bp<enter>
nnoremap <leader>l :ls<enter>
nnoremap <leader>d :bd<enter>
