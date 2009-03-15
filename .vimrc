set nocompatible        " use gVim defaults
set encoding=utf-8      " unicode encoding
syntax on               " enable syntax highlighting
if v:version >= 700
	set cursorline
	set listchars+=tab:��,trail:�,extends:~,nbsp:.
endif
if has('gui_running')
    let &guicursor = &guicursor . ",a:blinkon0"
    "set guioptions-=e
    set guioptions-=T
    "set guioptions-=m
    "set guioptions-=r
    "set guioptions+=a
    "set guioptions+=c
    if has ('win32')
        set columns=120
        set lines=60
        set guifont=DejaVu_Sans_Mono:h8:cANSI
    else
        set guifont=DejaVu\ Sans\ Mono\ 8
    endif
"elseif (&term =~ 'screen' || &term =~ 'linux')
elseif (&term =~ 'linux')
    set t_Co=16
    set termencoding=utf-8
    set nocursorline
    colorscheme desert
else
    set t_Co=256
    "colorscheme zenburn
    colorscheme wombat
    set mouse=a
    set ttymouse=xterm
    set termencoding=utf-8
endif
set shell=/bin/zsh
set vb                  " don't beep
set t_vb=               " ^
set foldenable          " allow folding code
set foldmethod=marker   " marks foldstarts/ends with {{{ }}}
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set textwidth=80
set autoindent          " auto indents next new line
set nosmartindent       " intelligent indenting -- DEPRECATED by cindent
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search
set backspace=indent,eol,start
set history=100         " 100 lines of command line history
set cmdheight=1         " command line height
set ruler               " ruler display in status line
set showmode            " show mode at bottom of screen
set number              " show line numbers
set nobackup            " disable backup files (filename~)
set showmatch           " show matching brackets (),{},[]
set whichwrap=h,l,<,>,[,]
set showcmd
set modeline
set wildmenu
set splitbelow
set formatoptions+=l
set selection=inclusive
set autowrite
set cinoptions=g0,:0,l1,(0,t0
set shortmess=a
set complete=.,t,i,b,w,k
set wildchar=<tab>
set wildmenu
set wildmode=longest:full,full
set previewheight=5

" Set up the status line
fun! <SID>SetStatusLine()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
    execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun
set laststatus=2
call <SID>SetStatusLine()

" common save shortcuts
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>

" Set taglist plugin options
"let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Compact_Format = 1
let Tlist_Show_Menu = 1

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" Set bracket matching and comment formats
set matchpairs+=<:>
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*
set comments+=b:\"
set comments+=n::

" Basic abbreviations
iab DATE <C-R>=strftime("%B %d, %Y (%H:%M)")<CR>

" Fix filetype detection
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.sys set filetype=php
au BufNewFile,BufRead grub.conf set filetype=grub
au BufNewFile,BufRead *.blog set filetype=blog

" C file specific options
au FileType c,cpp set cindent
au FileType c,cpp set formatoptions+=ro

" Ruby file specific options
au FileType ruby,eruby setlocal sts=2 sw=2
au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" HTML abbreviations
au FileType html,xhtml,php,eruby imap bbb <br />
au FileType html,xhtml,php,eruby imap aaa <a href=""></a><left><left><left><left><left><left>
au FileType html,xhtml,php,eruby imap iii <img src="" /><left><left><left><left>
au FileType html,xhtml,php,eruby imap ddd <div id=""></div><left><left><left><left><left><left><left><left>
au Filetype html,xhtml,php,eruby map <F8> :read /home/gig/code/html/templates/template.html<CR>

" Compile and run keymappings
au FileType php map <F6> :!php &<CR>
au FileType python map <F6> :!python %<CR>
au FileType perl map <F6> :!perl %<CR>
au FileType ruby map <F6> :!ruby %<CR>
au FileType lua map <F6> :!lua %<CR>
au FileType html,xhtml map <F6> :!firefox %<CR>

" MS Word document reading
au BufReadPre *.doc set ro
au BufReadPre *.doc set hlsearch!
au BufReadPost *.doc %!antiword "%"

" Reload vimrc when we edit it
au! BufWritePost .vimrc source %

" Toggle dark/light default colour theme for shitty terms
map <F2> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
" Toggle taglist script
map <F7> :Tlist<CR>

" Prevent annoying typo
imap <F1> <esc>
nmap q: :q<cr>

" VTreeExplorer
map <F12> :VSTreeExplore <CR>
let g:treeExplVertical=1
let g:treeExplWinSize=35
let g:treeExplDirSort=1

set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
set errorformat=%f:%l:%c:%*\d:%*\d:%*\s%m
