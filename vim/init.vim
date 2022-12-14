set termguicolors " why first, Tom?

lua require('plugins')
lua require('lsp')

set smartindent
set breakindent
set breakindentopt=shift:2
set completeopt=menu,menuone,noselect
set copyindent      " copy indent from the previous line
set expandtab       " tabs are space
set fillchars=horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┨,vertright:┣,verthoriz:╋
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=3 " global status line
set nospell
set noswapfile
set noswapfile
set number
set shiftwidth=4    " number of spaces to use for autoindent
set showbreak=↳
set signcolumn=yes
set smartcase
set softtabstop=4   " number of spaces in tab when editing
set spellsuggest+=10
set spellfile=~/.config/nvim/en.utf-8.add
set splitbelow
set splitright
set tabstop=4       " number of visual spaces per TAB
set scrolloff=3
set undodir=$HOME/nvim/undo
set undofile
set updatetime=1000
set wildmenu
set list
set listchars=tab:\ \ ,trail:·
set mouse=

" Bindings
nnoremap <SPACE> <Nop>
let mapleader = ' '
nnoremap <leader>f :Telescope find_files<cr>
nnoremap <leader>a :lua find_files_all()<cr>
nnoremap <leader>h :Telescope oldfiles<cr>
nnoremap <leader>gb :G blame<cr>
" copy filename
nnoremap <leader>cf :let @+=@%<cr> "copy file
" copy filename with line number
nnoremap <leader>cl :let @+=expand('%') .. ':' .. line('.')<cr>
nnoremap <leader>lr :Telescope registers<cr>
nnoremap <leader><Bslash> :TroubleToggle<cr>
nnoremap <Bslash> :TroubleToggle document_diagnostics<cr>
nnoremap <leader>p :!prettier -w %<cr>
nnoremap <leader>y @q
vnoremap Y "+y
nnoremap <leader><space> :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
nnoremap <leader>/ :nohlsearch<cr>
vnoremap p "_dP | "
nnoremap <leader>s :call TrimWhitespace()<cr>
nnoremap - :Neotree toggle<cr>
nnoremap <leader>o :only<cr>
nnoremap <leader>w :lua require('browse').input_search()<cr>
nnoremap <leader>d :lua require('browse.devdocs').search()<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" :W writes
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>

command! Date r!date "+\%F"
command! Now r!date

" Resize buffers when window changes sizes
autocmd VimResized * execute "normal! \<c-w>="

autocmd BufReadPost *.conf setl ft=conf
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

let g:better_whitespace_filetypes_blacklist=['dashboard']
let g:hardtime_default_on = 0

