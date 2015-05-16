" ~/.vimrc
"
" Author: Antonio Dias <accdias@gmail.com>
"

" Use vim settings instead of vi compatible mode
if &compatible
    set nocompatible
endif

" Use the operating system clipboard by default
if exists("&clipboard")
    set clipboard=unnamed
endif

" Use spaces instead of tabs
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set showmatch

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Keep 2000 lines of command line history
set history=2000

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" Use a dark background for color schemes
set background=dark

" Set vim to use 256 colors
set t_Co=256
"colorscheme wombat256mod
"colorscheme pablo
"colorscheme xoria256
colorscheme desert256

" Respect modelines embeded in buffers
set modeline
set modelines=4

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Better mark chars for list mode
set listchars=tab:»·,eol:¬,trail:·,nbsp:·,extends:\
"set showbreak=¬

" UTF-8 characters set
set encoding=utf-8 nobomb

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the (partial) command as it’s being typed
set showcmd

" Better status line
set statusline=%y\ %F%m%r%h%w\ (%03b:0x%02B)\ (%04l:%04v)\ (%p%%\ of\ %L)
set laststatus=2

" Use the window title as the statusline
"let &titlestring=&statusline
"set title

" Always set autoindenting on
set autoindent

" Don’t add empty newlines at the end of files
set binary
set noeol

" Mark the right margin at column 80
"set colorcolumn=80

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backup
set directory=~/.vim/swap
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Expose trailing white spaces
highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" Disable match of angle brackets
"set matchpairs=(:),{:},[:]

" Set the highlight colors of matching pairs to something more readable
highlight MatchParen ctermbg=black ctermfg=red cterm=bold

" Remove All the Trailing Whitespaces
"nnoremap <leader>W :%s,\s\+$,,<cr>:let @/=''<cr>

" Remap Leader key to comma
let mapleader=","

" Use <Leader>> and <Leader>< to page between buffers
noremap <silent><Leader>< :bp<cr>
noremap <silent><Leader>> :bn<cr>

" Use <Leader>s to sort a marked block
noremap <silent><Leader>s :sort<cr>

" Map ; to : and save a million keystrokes
nnoremap ; :

" Run Python Code from Vim
"map <f5> :w <cr>!clear <cr>:!python % <cr>

" Don't use Ex mode, use Q for formatting
map Q gq

" Auto close: parentheses, brackets, and braces
"imap { {}<left>
"imap ( ()<left>
"imap [ []<left>

" TODO: Set autocomplete of square brackets for html buffers
"if &filetype == 'html'
"	imap < <><left>
"endif

" Toggle booleans
nmap <silent><leader>h :set hlsearch!<cr>
nmap <silent><leader>l :set list!<cr>
nmap <silent><leader>n :set number!<cr>
nmap <silent><leader>p :set paste!<cr>
nmap <silent><leader>w :set wrap!<cr>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" User Ctrl-arrow keys to switch between splits
noremap <c-up> <c-w>k
noremap <c-down> <c-w>j
noremap <c-right> <c-w>l
noremap <c-left> <c-w>h

" User Ctrl-a to select all text
noremap <c-a> ggVG

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Reload configuration upon saving (from vimbits.com)
    autocmd! BufWritePost .vimrc source %

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

"ab teh the
ab _utf8 # -*- coding: utf-8 -*-
ab _vim # vim: expandtab tabstop=8 softtabstop=4 shiftwidth=4
