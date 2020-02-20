" automate plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'neovimhaskell/haskell-vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'posva/vim-vue'
Plug 'cakebaker/scss-syntax.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"Plug 'powerline/powerline'
call plug#end()

" Enable auto-save on startup
" Auto-save on all buffers
let g:auto_save=1
let g:auto_save_write_all_buffers=1

" In no compatible mode
set nocompatible

"Set the line number visible
set number relativenumber

" Tabs settings
set tabstop=4
set expandtab
set shiftwidth=4

" set line highlight
set cursorline

" Set search highlighting
set hls

" enable 14but true color
" set termguicolors

"Color theme set to dracula
colorscheme dracula
syntax on
set t_Co=256
" set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Tabs shortcuts
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>

" Moving through vim splits
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Vim-airline settings
" ====================
" Theme -> deus
let g:airline_theme='deus'
" show git branch
let g:airline#extensions#hunks#enabled=1

" NERDTree settings
" =================
" Show hidden files
let NERDTreeShowHidden=1
map <C-f> :NERDTreeToggle<CR>

" Vim-JavaScript settings
" =======================
" Enable syntax highlighting for JSDOCS
let g:javascript_plugin_jsdoc = 1

" Haskell-vim settings
let g:haskell_enable_quantification=1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo=1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax=1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms=1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles=1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers=1  " to enable highlighting of `static`
let g:haskell_backpack=1                " to enable highlighting of backpack keywords

" Stop vim from slowing down with vim-vue
let g:vue_pre_processors=[]

" instant-markdown configs
let g:instant_markdown_slow=1
let g:instant_markdown_autostart=0
let g:instant_markdown_mathjax = 1

" set prolog syntax when opening a .pl file
" autocmd BufNewFile,BufRead *.pl set syntax=prolog
let g:filetype_pl="prolog"

