" ~/.vimrc
"
" Author: Antonio Dias <accdias@gmail.com>
"

" Use the operating system clipboard by default
if exists("&clipboard")
    set clipboard^=unnamed
endif

" Display settings
set nowrap                              " dont wrap lines
set ruler                               " show cursor position in status bar
set scrolloff=2                         " 2 lines above/below cursor when scrolling
set showcmd                             " show typed command in status bar
set showmatch                           " show matching bracket
set matchtime=2                         " show matching bracket for 0.2 seconds
set matchpairs+=<:>                     " specially for html
set title                               " show file in titlebar
set listchars=tab:»⋅,trail:⋅,nbsp:⋅     " Better mark chars for list mode
"set showbreak=¬                        " show line breaks
set encoding=utf-8 nobomb               " UTF-8 characters set
set shortmess=atI                       " Disable vim intro message
"set colorcolumn=75                     " Mark the right margin at column 80
set signcolumn=yes                      " Always shows the sign column
set number                              " Always shows line numbers

set wildmenu                            " completion with menu
set wildignore=*~
set wildignore+=eggs/**
set wildignore+=.git
set wildignore+=.svn
set wildignore+=*.bak
set wildignore+=*.egg-info/**
set wildignore+=*.exe
set wildignore+=*.o
set wildignore+=*.obj
set wildignore+=*.pyc
set wildignore+=*.py[co]
set wildignore+=*.swp

colorscheme pythonista

" Change the vertical split character
"set fillchars+=vert:┃
"set fillchars+=vert:┆
"set fillchars+=vert:┇
set fillchars+=vert:┊
"set fillchars+=vert:┋
"set fillchars+=vert:╎
"set fillchars+=vert:╏
"set fillchars+=vert:║

" Use spaces instead of tabs
set tabstop=8                           " See https://www.reddit.com/r/vim/wiki/tabstop
set softtabstop=4
set shiftwidth=4
set expandtab

" Autoindent settings
set autoindent
set smarttab

" Don't add empty newlines at the end of files
"set binary
"set noeol

" UNIX format for end of lines
set fileformat=unix                     " file mode is unix

" Search tweaks
set ignorecase                          " case insensitive searching
set smartcase                           " but become case sensitive if you type uppercase characters
"set magic                              " change the way backslashes are used in search patterns
"set incsearch                          " Do incremental searching

"set lazyredraw                         " redraw only when we need to
"set esckeys                            " Allow cursor keys in insert mode
set backspace=indent,eol,start          " Allow backspacing over everything in insert mode
set ttyfast                             " Optimize for fast terminal connections
set history=2000                        " Keep 2000 lines of command line history

"set modeline                           " Respect modelines embeded in buffers
"set noerrorbells                       " Disable error bells
set nostartofline                       " Don’t reset cursor to start of line when moving around.

set foldenable                          " enable folding
set foldlevelstart=10                   " open most folds by default
set foldnestmax=10                      " 10 nested fold max
set foldmethod=indent                   " fold based on indent level
" space open/closes folds
nnoremap <space> za

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backup
set directory=~/.vim/swap
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Enable mouse just for visual selection mode
"if has('mouse')
"  set mouse=v
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Expose trailing white spaces
match WhitespaceEOL /\s\+$/

" Remap Leader key to comma
let mapleader=","

" Use <Leader>> and <Leader>< to page between buffers
noremap <silent><Leader>< :bp<cr>
noremap <silent><Leader>> :bn<cr>

" Use <Leader>s to sort a marked block
noremap <silent><Leader>s :sort<cr>

" Map ; to : and save a million keystrokes
nnoremap ; :

" Don't use Ex mode, use Q for formatting
noremap Q gq

" Join 6 lines
noremap <silent>1 :j6<cr><down>

" Toggle booleans
noremap <silent><leader>h :set hlsearch!<cr>
noremap <silent><leader>l :set list!<cr>
noremap <silent><leader>n :set number!<cr>
noremap <silent><leader>p :set paste!<cr>
noremap <silent><leader>w :set wrap!<cr>

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

" Enable file type automatic detection.
filetype plugin indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    augroup formats
        autocmd!
        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text
                \ set textwidth=78
        " Defaults for some languages
        autocmd FileType tex,xslt,xml,css,html,xhtml,javascript,docbook
                \ set softtabstop=2 shiftwidth=2
    augroup END

    augroup templates
        autocmd!
        " Load ~/.vim/skel/<type> for new <type> files
        autocmd BufNewFile *.* silent! execute '0read ' . globpath(&rtp, 'skel/' . tolower(expand('<afile>:e')))
        " Poor man's template system: replace some predefined @VAR@
        autocmd BufNewFile * silent! %s/@FILENAME@/\=expand('<afile>:t')/ge
        autocmd BufNewFile * silent! %s/@FILETYPE@/\=&filetype/ge
        autocmd BufNewFile * silent! %s/@ENCODING@/\=&encoding/ge
        autocmd BufNewFile * silent! %s/@DAY@/\=strftime('%d')/ge
        autocmd BufNewFile * silent! %s/@MONTH@/\=strftime('%m')/ge
        autocmd BufNewFile * silent! %s/@YEAR@/\=strftime('%Y')/ge
        autocmd BufNewFile * silent! %s/@TIME@/\=strftime('%H:%M:%S')/ge
        autocmd BufNewFile * silent! %s/@ISODATE@/\=strftime('%F')/ge
        autocmd BufNewFile * silent! %s/@FULLDATE@/\=strftime('%c')/ge
    augroup END

    augroup movecursor
        " When opening a file, jump to the last known cursor position.
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END

    augroup autotrim
        autocmd!
        " Remove trailing white spaces before saving
        autocmd BufWritePre * silent! %s/\s\+$//ge
    augroup END

    augroup reloadvimrc
        autocmd!
        " Reload configuration upon saving (from vimbits.com)
        autocmd! BufWritePost .vimrc source %
        autocmd! BufWritePost vimrc source %
    augroup END
endif " has("autocmd")

" Show difference between the current buffer and the file it was loaded from.
if !exists(":ShowDiff")
    command ShowDiff vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

" Abbreviations
abbreviate _python #!/usr/bin/env python
abbreviate _python3 #!/usr/bin/env python3
abbreviate _utf8 # -*- coding: utf-8 -*-
abbreviate _vim # vim:ts=8:sts=4:sw=4:et

" Enable rainbow plugin features
" set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

" Validator plugin settings
let g:validator_python_checkers = ['flake8']
let g:validator_css_checkers = ['csslint']
" Customize Validator error message
let g:validator_error_msg_format = "● %d/%d issues"
" To auto open quickfix window:
let g:validator_auto_open_quickfix = 1
" To show permanently the sign column
let g:validator_permament_sign = 1
" For validator with flake8
let g:validator_python_flake8_args = '--max-line-length=120'
" Change validator symbol
let g:validator_error_symbol = 'x'
let g:validator_warning_symbol = '!'
let g:validator_style_error_symbol = '.'
let g:validator_style_warning_symbol = '>'
