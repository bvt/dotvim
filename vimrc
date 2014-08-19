" vim:fdm=marker
"
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
" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call pathogen
execute pathogen#infect()
call pathogen#helptags()

" Enable filetype plugins
filetype plugin on
filetype indent on

" set leader
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Forget compatibility with Vi. Who cares.
set nocompatible

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

set ttyfast

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Wild menu {{{
" Turn on the Wild menu
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
" }}}

" Set Stuff {{{
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
" set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
set matchtime=3

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

set mousemodel=popup

" highlight current line
set cul

" adjust color
hi CursorLine term=none cterm=none ctermbg=3

nnoremap <silent> <F9> :TagbarToggle<CR>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colors and Fonts {{{
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
" }}}

" Files, backups and undo {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Set to auto read when a file is changed from the outside
set autoread
" }}}

" ctrlp Settings {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim

if executable('ag')
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

" ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
" Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Default to filename searches
let g:ctrlp_by_filename = 1

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.sass-cache$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so|\.DS_Store$'
            \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2
" Set 10000 max file limit
let g:ctrlp_max_files = 10000
" max directory recursion
let g:ctrlp_max_depth = 20
" Map execution of ctrlp to ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" }}}

" Drupal Settings {{{
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
    autocmd BufRead,BufNewFile *.scss set filetype=scss
    autocmd BufNewFile,BufRead mozex.textarea.* setlocal filetype=typoscript
    autocmd BufNewFile,BufRead *.ts setlocal filetype=typoscript
  augroup END
endif
" }}}

" SQL syntax highlighting inside Strings
let php_sql_query = 1
" HTML syntax highlighting inside strings
let php_htmlInStrings = 1

" Text, tab and indent related {{{
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

" }}}

" Enable code folding {{{
set foldenable

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

inoremap <F1> <C-O>za
nnoremap <F1> za
onoremap <F1> <C-C>za
vnoremap <F1> zf

" }}}

" omnicomplete {{{
set omnifunc=syntaxcomplete#Complete
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd FileType css,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
if has('python3')
  autocmd FileType python setlocal omnifunc=python3complete#Complete
else
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal foldmethod=indent
" add vim OmmiComplete to SuperTab
let g:SuperTabDefaultCompletionType = "context"

" let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
" }}}

" => Visual mode related {{{
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

" To select the last changed text (or the text that was just pasted)
nnoremap gp `[v`]
" }}}

" Moving around, tabs, windows and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easier window navigation
nmap <leader><left> <C-w>h
nmap <leader><down> <C-w>j
nmap <leader><up> <C-w>k
nmap <leader><right> <C-w>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

vmap <leader>f zf
map <leader>a za

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

let g:EasyMotion_leader_key = ','
" }}}

" => Status line {{{
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
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
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
" }}}

" => Editing mappings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Split
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>
"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Remove trailing whitespaces and ^M chars
autocmd FileType php,js,python,twig,xml,yml,css,scss autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Enforce consistent line endings: if 'ff' is set to "unix" and there are any
" stray '\r' characters at ends of lines, then automatically remove them. See
" $VIMRUNTIME/indent/php.vim .
let PHP_removeCRwhenUnix = 1

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()
autocmd BufWrite *.module :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

let g:user_emmet_leader_key='<c-y>'
" use both <Tab> and <C-Y> to trigger the emmet.
let g:user_emmet_expandabbr_key = '<Leader>.'
let g:user_emmet_next_key = '<Leader>-'
let g:user_emmet_prev_key = '<Leader>,'
let g:user_emmet_togglecomment_key = '<Leader>/'

" For visual mode (e.g. vip<Enter>=)
vmap <Enter>   <Plug>(EasyAlign)

map <leader>g :call Stringify()<CR>
" }}}

" => vimgrep searching and code displaying {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" applies substitutions globally on lines. Instead of :%s/foo/bar/g just type :%s/foo/bar/
set gdefault

" clear out search hightlights
nnoremap <leader><space> :noh<cr>
" }}}

" Syntastic {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntastic syntax checking
" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': [] }
" syntastic will do syntax checks when buffers are first loaded as well as on saving, default 0
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_enable_balloons = 1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=0
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_aggregate_errors = 1
let g:syntastic_scss_checkers = ['scss-lint']

" }}}

" => Misc {{{
" matchit
" % to bounce from do to end etc.
runtime! macros/matchit.vim

" edit my vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" }}}

" => Helper functions {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
" }}}
