let $LANG='en_US.UTF-8'

if &compatible
    set nocompatible
endif

" BEGIN vim-plug

" Download vim-plug when not exist
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('$HOME/.local/share/nvim/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'
Plug 'kannokanno/previm'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
call plug#end()

" Install
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" END vim-plug

set shell=zsh

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

if !has('gui_running')
    set t_Co=256
endif
set background=dark
set termguicolors
set noerrorbells
set shellslash
set showmatch matchtime=1
set cinoptions+=0
set showcmd
set display=lastline
set list
set listchars=tab:^\ ,trail:~
set history=10000
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions+=R
set showmatch
set smartindent
set noswapfile
set nofoldenable
set title
set number
set nrformats=
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set noshowmode
set clipboard+=unnamed

" key mapping
inoremap <silent> jj <ESC>
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
onoremap i<space> iW
xnoremap i<space> iW
nnoremap U <c-r>
noremap M %
xnoremap < <gv
xnoremap > >gv

colorscheme iceberg
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:tmuxline_preset = {
      \'a'    : 'TMUX',
      \'b'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%Y-%m-%d(%a) %H:%M:%S',
      \'y'    : '#h'}
let g:tmuxline_theme = 'iceberg'

let mapleader = "\<space>"

set runtimepath+=/opt/homebrew/bin/fzf

function! FZGrep(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

nnoremap <silent> <Leader>p :GFiles<CR>
nnoremap <silent> <Leader>P :Files<CR>
nnoremap <silent> <Leader>s :RG<CR>
nnoremap <silent> <Leader>c :Commits<CR>

