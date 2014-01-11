execute pathogen#infect()
call pathogen#helptags()

syntax on
" Forget compatibility with Vi. Who cares.  
set nocompatible
" always set autoindenting on
set autoindent          
set backspace=indent,eol,start
" set leader
let mapleader = ","
let maplocalleader = ","
" line numbers on
set number              
set cindent
set autoindent
set vb t_vb=
" balance parenthese
set showmatch		
set smarttab
set complete-=i

filetype plugin on
filetype indent on

set encoding=utf-8

"Switch between buffers without saving  
set hidden  

" Indent stuff  
set smartindent  
set autoindent  

" Hide MacVim toolbar by default  
set go-=T  

" autocomplete commands
set wildmenu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set ruler
set showcmd
set laststatus=2

" Enable code folding  
set foldenable  
" easier window navigation  
nmap <C-h> <C-w>h  
nmap <C-j> <C-w>j  
nmap <C-k> <C-w>k  
nmap <C-l> <C-w>l  
" autopen NERDTree and focus cursor in new document  
" autocmd VimEnter * NERDTree  
" autocmd VimEnter * wincmd p  
" Shortcut for NERDTreeToggle  
" nmap <leader>nt :NERDTreeToggle <CR>  
" Show hidden files in NerdTree  
" let NERDTreeShowHidden=1  

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

" Color Settings
set background=dark
colorscheme solarized

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

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

" airline
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

let g:solarized_contrast = 'normal'
let g:solarized_visibility = 'normal'
let g:airline_theme = 'solarized'
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
