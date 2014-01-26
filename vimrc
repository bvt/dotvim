" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call pathogen
execute pathogen#infect()
call pathogen#helptags()

" Enable filetype plugins
filetype plugin on
filetype indent on

" set leader
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","

" Forget compatibility with Vi. Who cares.  
set nocompatible

" Fast saving
nmap <leader>w :w!<cr>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on the WiLd menu
set wildmenu
"Complete longest string, then list alternatives
set wildmode=list:longest,list:full     
"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~ 
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.svn,*.git

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

"Switch between buffers without saving  
set hidden  

set backspace=indent,eol,start

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Hide MacVim toolbar by default  
set go-=T  

" line numbers on
set number    

" show information about the current command
set showcmd

"Start scrolling when we're 8 lines away from margins

set scrolloff=8         
set sidescrolloff=15
set sidescroll=1

" display the current mode
set showmode

" Use modeline overrides
set modeline
set modelines=10

" highlight current line
set cul

" adjust color
hi CursorLine term=none cterm=none ctermbg=3


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Color Settings
set background=dark
colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Set to auto read when a file is changed from the outside
set autoread 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai 		"Auto indent
set si 		"Smart indent

" dont't wrap lines
set nowrap

"Break lines when appropriate
set linebreak               

" Enable code folding  
set foldenable  

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easier window navigation  
nmap <C-h> <C-w>h  
nmap <C-j> <C-w>j  
nmap <C-k> <C-w>k  
nmap <C-l> <C-w>l  

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" airline
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" Status bar
if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"let g:solarized_contrast = 'normal'
"let g:solarized_visibility = 'normal'
"let g:airline_theme = 'solarized'
let g:airline_symbols.space = "\ua0"
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
" unicode symbols
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" applies substitutions globally on lines. Instead of :%s/foo/bar/g just type :%s/foo/bar/
set gdefault     

" clear out search hightlights
nnoremap <leader><space> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""






" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif



map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>

" ctrlp Settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.sass-cache$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }
 
" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2
" Set no max file limit
let g:ctrlp_max_files = 0



" emmet Settings
" let g:user_emmet_settings = {
"   \  'php' : {
"   \    'extends' : 'html',
"   \    'filters' : 'c',
"   \  },
"   \  'xml' : {
"   \    'extends' : 'html',
"   \  },
"   \  'haml' : {
"   \    'extends' : 'html',
"   \  },
" }

" Drupal Settings
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
syntax on
