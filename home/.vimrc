" Disable vi 
set nocompatible
filetype off

" Use Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'majutsushi/tagbar'
Plugin 'milkypostman/vim-togglelist' 
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'Valloric/YouCompleteMe' 
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'joshdick/onedark.vim'

" Preferences
" -----------------------------------------------------------------------------
" Behavior
filetype plugin indent on
set encoding=utf-8
syntax on
set modelines=0
set autoindent
set autoread
set smartindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set completeopt=longest,menu
set pumheight=20

" Buffers
set hidden
set splitbelow splitright
set autowrite
set clipboard=unnamed
set wildignore+=*.DS_Store,.git,*.swp,node_modules

" Backups
set history=1000
set undolevels=1000
set nobackup
set directory=~/.vim/tmp/swap/

" Searching
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
set grepprg=ack

" Airline Status Bar
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
set laststatus=2

" UI
set t_Co=256
set scrolloff=3
set sidescrolloff=3
set ruler
set number
set title
set nostartofline
set showmode
set noshowcmd
set noerrorbells
set novisualbell
set ttyfast
set laststatus=2
" set list
set foldlevelstart=0
set foldmethod=marker
set formatoptions=tcq
set nowrap

if has("mouse")
 set mouse=a
endif

if $TERM == 'xterm-color' && &t_Co == 8
  set t_Co=16
endif

let mapleader=','

" Plugin configurations
" -----------------------------------------------------------------------------
runtime macros/matchit.vim

" NERDTree ignores
let NERDSpaceDelims=1
let NERDTreeWinSize=30
let g:NERDTreeIgnore=['build$','tags', '.git']
highlight link NERDTreeExecFile ModeMsg " Disable horrible bg on executable files in NERDTree

let g:ctrlp_custom_ignore='vendor/bundle\|.sass-cache\|tmp/cache\|.git$'
let g:ctrlp_by_filename=1
let g:ctrlp_extensions=['line', 'changes']
let g:ctrlp_cache_dir=$HOME.'/.vim/tmp/ctrlp/'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['settings.json']

let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map={'mode': 'active','passive_filetypes': ['scss', 'sass']}
let g:syntastic_typescript_checkers = ['tslint']

let g:snippets_dir=$HOME.'/.vim/snippets/'

let g:yankring_window_height=10
let g:yankring_history_dir=$HOME.'/.vim/tmp/yankring/'

" Disable GitGutter on startup and not so eager on the repaints
let g:gitgutter_enabled=0
let g:gitgutter_eager=0

let g:tagbar_sort=0
" if executable('coffeetags')
"   let g:tagbar_type_coffee = {
"       \ 'kinds': ['f:functions', 'o:object'],
"       \ 'kind2scope': {'f': 'object', 'o': 'object'},
"       \ 'sro': ".", 'ctagsbin': 'coffeetags', 'ctagsargs': '--include-vars ',
"       \}
" endif

let g:ackprg = 'ag --nogroup --nocolor --column'


" Key mapping
" -----------------------------------------------------------------------------
" RSI reduction
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>
inoremap jk <ESC>

" Move between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Block movement
nmap <tab> %
vmap <tab> %

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Clear the search highlight
map <silent> \ :silent nohlsearch<cr>

" Enable n0ob save
map <M-s> :w<kEnter>
imap <M-s> <Esc>:w<kEnter>i

" Function keys for plugin lists, <F8>-<F10> is reserved for .vimrc.local
let g:ctrlp_map='<F1>'
map <F2> :NERDTreeToggle<cr>
map <F3> :BuffergatorToggle<cr>
nnoremap <silent> <F4> :TagbarToggle<cr>
nnoremap <silent> <F5> :YRShow<cr>
ino <silent> <F6> <c-r>=ShowAvailableSnips()<cr>

" Bubble single lines (requires unimpaired.vim)
nmap <F11> ]e
nmap <F12> [e

" Bubble multiple lines in visual mode (requires unimpaired.vim)
vmap <F11> ]egv
vmap <F12> [egv

" Use :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Inserts the path of the current file from command mode: ctrl+p
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Leader mapping
" -----------------------------------------------------------------------------
" Find the goods, ag style
map <leader>f :Ag 

" Edit .vimrc, .vimrc.local and .bashrc_local
nmap <leader>evm <C-w><C-v><C-l>:e ~/.vimrc<cr>
nmap <leader>evl <C-w><C-v><C-l>:e ~/.vimrc.local<cr>
nmap <leader>ebl <C-w><C-v><C-l>:e ~/.bashrc_local<cr>

" Collapse all multi-line occurrences of whitespace into one line
map <leader>CN :%s/^\n\+/\r//<cr>:let @/=''<cr>

" Clean whitespace
map <leader>CW :%s/\s\+$//<cr>:let @/=''<cr>

" Strip `{|}|;` (JS -> CS...)
map <leader>CC :%s/{//e \| %s/;//e \| %s/}//e \| %s/\s\+$//<cr><cr>:let @/=''<cr>

" Convert CSS to Sass
map <leader>CS :!sass-convert -F css -T sass<cr>

" Reload ctags
map <leader>rt :!ctags --extra=+f -R *<cr><cr>

" Closes the window showing the location list from syntastic errors
map <silent><leader>lc :lcl<cr>

" Yank/paste contents using an unnamed register
vmap <silent><leader>y "xy
map <silent><leader>p "xp

" Toggles GitGutter for a file
map <silent><leader>gg :GitGutterToggle<cr>

" File type utility functions
" -----------------------------------------------------------------------------
" Turn wrapping on for text based languages (markdown, txt...)
function! s:setWrapping()
  setlocal wrap linebreak nolist spell textwidth=72
endfunction

" Wrap markdown and compile on save using the markdown preview bundle
function! s:setMarkdown()
  call s:setWrapping()
  au! BufWritePost *.{md,markdown,mdown,mkd,mkdn} :MDP
endfunction

" File handling and settings
" -----------------------------------------------------------------------------
if !exists("autocommands_loaded")
  let autocommands_loaded=1

  " File type settings on load
  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} setf markdown | call s:setMarkdown()
  au BufRead,BufNewFile *.json set filetype=json | setlocal conceallevel=0
  au BufRead,BufNewFile *.hamlc set filetype=haml
  au BufRead,BufNewFile *.emblem set filetype=slim
  au BufRead,BufNewFile *.txt call s:setWrapping()

  " Reload .vimrc after it or vimrc.local has been saved
  au! BufWritePost .vimrc source %
  au! BufWritePost .vimrc.local source ~/.vimrc

  " Reload all snippets when creating new ones.
  au! BufWritePost *.snippets call ReloadAllSnippets()

  " Enable omnicomplete for supported filetypes
  autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
  autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
endif

" Load user config
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

