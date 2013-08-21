" ~/.vimrc
"
" Author: Antonio Dias <accdias@gmail.com>
"

" Use vim settings
set nocompatible

" Use the operating system clipboard by default
if exists("&clipboard")
	set clipboard=unnamed
endif

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Keep 50 lines of command line history
set history=200

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" Use a dark background for color schemes
set background=dark

" Respect modelines embeded in buffers
set modeline
set modelines=4

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Better mark chars for list mode
"set listchars=tab:»·,eol:¬,trail:·,nbsp:·,extends:\
set listchars=tab:»·,eol:¬,trail:·,nbsp:·,extends:\
set showbreak=¬

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

" Centralize backups, swapfiles and undo history
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
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

" Expose white trailing white spaces
highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" Remap Leader key to comma
let mapleader=","

" Use <Leader>> and <Leader>< to page between buffers
noremap <silent><Leader>< :bp<cr>
noremap <silent><Leader>> :bn<cr>

" Map ; to : and save a million keystrokes
nnoremap ; :

" Remove All the Trailing Whitespaces
"nnoremap <leader>W :%s#\s\+$##<cr>:let @/=''<cr>

" Run Python Code from Vim
"map <f5> :w <cr>!clear <cr>:!python % <cr>

" Don't use Ex mode, use Q for formatting
map Q gq

" Auto close: parentheses, brackets, and braces
imap { {}<left>
imap ( ()<left>
imap [ []<left>

" Toggle booleans
nmap <silent><Leader>h :set hlsearch! hlsearch?<CR>
nmap <silent><Leader>l :set list! list?<CR>
nmap <silent><Leader>n :set number! number?<CR>
nmap <silent><Leader>p :set paste! paste?<CR>
nmap <silent><Leader>w :set wrap! wrap?<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif