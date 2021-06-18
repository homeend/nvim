" plugins
let need_to_install_plugins = 0

let uname = substitute(system('uname'), '\n', '', '')
" Example values: Linux, Darwin, MINGW64_NT-10.0, MINGW32_NT-6.1

if uname == 'Linux' || uname == 'Darwin'
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      let need_to_install_plugins = 1
  endif
else
  if empty(glob('~/AppData/Local/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/AppData/Local/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      let need_to_install_plugins = 1
  endif
endif

set nocompatible
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set guicursor=
set relativenumber
set nu
set hlsearch
set hidden
set noerrorbells
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=120
set signcolumn=yes
set cmdheight=2
set updatetime=50
set secure
set clipboard+=unnamedplus
set fdm=indent
set foldlevelstart=99
set splitbelow splitright " default for split open

filetype plugin on
filetype plugin indent on
syntax on

if uname == 'Linux' || uname == 'Darwin'
    let g:python3_host_prog = '~/pynvim/.venv/bin/python'
else
    let g:python3_host_prog = '~/pynvim/.venv/Scripts/python'
endif

let g:loaded_python_provider = 0

if uname == 'Linux' || uname == 'Darwin'
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/AppData/Local/nvim/plugged')
endif

Plug 'joshdick/onedark.vim'
Plug 'ambv/black'
Plug 'joshdick/onedark.vim'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jeetsukumaran/vim-pythonsense'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py -all' }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'

Plug 'wellle/targets.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'itchyny/lightline.vim' " bottom status bar

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' " dosent work with windows
Plug 'airblade/vim-gitgutter'

if has('nvim')
    " Adds neovim support to vim-dispatch
    Plug 'radenling/vim-dispatch-neovim'
endif

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'   }
Plug 'junegunn/vim-peekaboo'

" leader i - overview window
Plug 'majutsushi/tagbar' 

Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'liuchengxu/vim-which-key'
Plug 'justinmk/vim-sneak'

" list of recently opened files
Plug 'mhinz/vim-startify'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vifm/vifm.vim'

call plug#end()

" install plugin if plugin dir dosen't exists
if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

imap kj <ESC>
colorscheme onedark
highlight Normal guibg=none

nmap <F6> i<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>
imap <F6> <C-R>=strftime("%Y-%m-%d %H:%M")<CR>

let mapleader = " "
let maplocalleader = "\\" " used to run python, js, bash/sh code

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1 
let NERDTreeQuitOnOpen=1 

let g:ale_linters = {
      \   'python': ['flake8'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}


let g:ale_fixers = {
      \    'python': ['black'],
      \}

nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1

" Paste with <Shift> + <Insert>
imap <S-Insert> <C-R>*"

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

set cursorline
nnoremap <leader>li :set cursorline!<CR>
nnoremap <leader>vv :vsplit<CR>  
nnoremap <leader>ec :vsplit $MYVIMRC<CR>  
nnoremap <leader>sc :source $MYVIMRC<CR>     
nnoremap <leader>mmm mzggvGgq`z
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>aa :Ag<CR>

nnoremap <leader>a :<C-u>nohlsearch<CR><C-l>
nnoremap <leader>j :bprevious<CR>
nnoremap <leader>k :bnext<CR>
nnoremap <leader>h :bfirst<CR>
nnoremap <leader>l :blast<CR>

"nnoremap <leader>i :ls<CR>:b<Space>
nnoremap <leader>dd :bd<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :write<CR>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

nnoremap <leader>ar :setlocal cursorline!<CR>
nnoremap <leader>ac :setlocal cursorcolumn!<CR>

"switch between buffers
nnoremap <leader><tab> <C-^><CR>
nnoremap <leader>yy :normal "+yy<CR>
xnoremap <leader>yy :normal gv"+y<CR>

if has('mouse')
      set mouse=a
endif

" Paste with middle mouse click
vmap <LeftRelease> "*ygv

let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction



" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

"function! StartUp()
    "if 0 == argc()
        "NERDTree
    "end
"endfunction
"autocm  VimEnter * call StartUp()

" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)

" tags
map <leader>i :TagbarToggle<CR>

" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


" tab navigation: Alt or Ctrl+Shift may not work in terminal:
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" move to the previous/next tabpage.
nnoremap <C-j> gT
nnoremap <C-k> gt

" Go to last active tab 
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

augroup exec_code
      autocmd!

      autocmd FileType python nnoremap <buffer> <localleader>r 
                        \ :sp<CR> 
                        \ :term python %<CR> 
                        \ :startinsert<CR>

      autocmd FileType javascript nnoremap <buffer> <localleader>r 
                        \ :sp<CR> 
                        \ :term node %<CR> 
                        \ :startinsert<CR>
     
      autocmd FileType bash,sh nnoremap <buffer> <localleader>r 
                        \ :sp<CR> 
                        \ :term bash %<CR>
                        \ :startinsert<CR>

      autocmd FileType bash,sh nnoremap <buffer> <localleader>B 
                        \ :term bash %<CR>
                        \ :startinsert<CR>
augroup END


" vim which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey '\\'<CR>
vnoremap <silent> <localleader> :WhichKeyVisual '\\'<CR>

" sneak
let g:sneak#label = 1

au BufNewFile,BufRead *.py set foldmethod=indent

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()



let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

