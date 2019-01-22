call plug#begin('~/.vim/plugged')
" Load up all the plugins
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'cakebaker/scss-syntax.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'majutsushi/tagbar'
Plug 'neomake/neomake'
Plug 'posva/vim-vue'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/dbext.vim'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Colorschemes
Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
Plug 'fcpg/vim-orbital'
Plug 'jacoborus/tender.vim'
Plug 'kristijanhusak/vim-hybrid-material'
call plug#end()
call neomake#configure#automake('w')
syntax enable
filetype plugin indent on
colorscheme hybrid_material
set background=dark

set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set bs=2
set ts=4
set sw=4
set nocompatible
set history=9999
set incsearch
set splitbelow
set splitright
set matchtime=5
set showmatch
set noswapfile
set nobackup
set nowritebackup
set wildmenu
set nu
set tags=./tags;/
set nowrap
set linebreak
set nolist
set colorcolumn=100
set textwidth=100
set clipboard=unnamed
set formatoptions-=tc
set completeopt=longest,menuone,preview

" Simple function to make it easier to toggle the background color
function BackgroundToggle()
    if &background == "light"
        set background=dark
    else
        set background=light
    endif
endfunction

nnoremap <C-S-k> ddkP
nnoremap <C-S-j> ddp
vnoremap <C-S-k> xkP`[V`]
vnoremap <C-S-j> xp`[V`]

nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map <silent> <C-f> :BLines<CR>
map <silent> <C-n> :FZF!<CR>
map <silent> <F4> :call BackgroundToggle()<CR>
map <silent> <F12> :VimShell<CR>
map <F7> mzgg=G`z<CR>
map <silent> <F8> :TagbarToggle<CR>
map <silent> <F9> :NERDTreeToggle<CR>
map <silent> <ESC> :pclose<CR>:lclose<CR>

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        lopen
    endif
endfunction

nnoremap <silent> <C-e> :<C-u>silent! call ToggleErrors()<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd! BufEnter * Neomake
autocmd! BufWritePost * Neomake

autocmd FileType css set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType eruby set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType scss set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType vue syntax sync fromstart
autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 50
let g:deoplete#enable_smart_case = 1

let g:neosnippet#enable_completed_snippet = 1

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme = "hybrid"

let g:rustfmt_autosave = 1

let g:racer_experimental_completer = 1

let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E501'],
    \ }
let g:neomake_python_enabled_makers = ['flake8']
