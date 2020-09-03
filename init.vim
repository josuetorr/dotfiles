" " automate plug installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
 endif

" vim-plug plugin manager
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'rrethy/vim-hexokinase', {'do': 'make hexokinase'} will add once I need
" to use golang
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'unblevable/quick-scope'
Plug 'wincent/terminus'
Plug 'vim-airline/vim-airline'
Plug 'kovetskiy/sxhkd-vim' "sxhkd syntax highlighting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug '907th/vim-auto-save'
Plug 'pangloss/vim-javascript'
Plug 'chemzqm/vim-jsx-improve'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'mattn/emmet-vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'neovimhaskell/haskell-vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'posva/vim-vue'
Plug 'cakebaker/scss-syntax.vim'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'ap/vim-css-color' " might remove it
call plug#end()

" Enable auto-save on startup
" Auto-save on all buffers
" let g:auto_save=1
" let g:auto_save_write_all_buffers=1

" In no compatible mode
set nocompatible

" No backup
set nobackup

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

" Splits settings
set splitbelow
set splitright

" Tabs shortcuts
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>

" Moving through vim splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" FZF map
noremap <C-p> :FZF<CR>


" Setting folds
set foldenable

" Enable modify file directory
set ma

" Vim-airline settings
" ====================
let g:airline_theme="shades_of_purple"
let g:shades_of_purple_airline=1
" show git branch
let g:airline#extensions#hunks#enabled=0

" Quick-scope settings
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
" highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

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
" let g:instant_markdown_slow=1
" let g:instant_markdown_autostart=0
" let g:instant_markdown_mathjax = 1

" set prolog syntax when opening a .pl file
" autocmd BufNewFile,BufRead *.pl set syntax=prolog
let g:filetype_pl="prolog"

" set mustache syntax to html color
let g:filetype_mst="html"

" COC settings
let g:coc_global_extensions = ['coc-prettier', 'coc-json', 'coc-tsserver', 'coc-emmet', 'coc-tslint']

" Enable Prettier on save
let g:prettier#single_quote = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Tmux settings for cursor change on VI-mode
if exists('$TMUX')
    let &t_SI .= "\ePtmux;\e\e[=1c\e\\"
    let &t_EI .= "\ePtmux;\e\e[=2c\e\\"
 else
    let &t_SI .= "\e[=1c"
    let &t_EI .= "\e[=2c"
 endif
