" ~/.vimrc
"
" Author: Antonio Dias <accdias <at> gmail.com>
"

" Use vim settings instead of vi compatible mode
if &compatible
    set nocompatible
endif

" Use the operating system clipboard by default
if exists("&clipboard")
    set clipboard=unnamed
endif

" Display settings
set background=dark                    " enable for dark terminals
set nowrap                             " dont wrap lines
"set number                            " show line numbers
set ruler                              " show cursor position in status bar
set scrolloff=2                        " 2 lines above/below cursor when scrolling
set showcmd                            " show typed command in status bar
set showmatch                          " show matching bracket
set matchtime=2                        " show matching bracket for 0.2 seconds
set matchpairs+=<:>                    " specially for html
set title                              " show file in titlebar
set listchars=tab:»⋅,trail:⋅,nbsp:⋅    " Better mark chars for list mode
"set showbreak=¬                        " show line breaks
set t_Co=256                           " Set vim to use 256 colors
set encoding=utf-8 nobomb              " UTF-8 characters set
set shortmess=atI                      " Disable vim intro message
"set colorcolumn=80                     " Mark the right margin at column 80

set wildmenu                           " completion with menu
set wildignore=*~
set wildignore+=*.bak
set wildignore+=*.exe
set wildignore+=.git
set wildignore+=*.o
set wildignore+=*.obj
set wildignore+=*.pyc
set wildignore+=*.py[co]
set wildignore+=.svn
set wildignore+=*.swp

"colorscheme wombat256mod
"colorscheme pablo
"colorscheme xoria256
colorscheme desert256

" Use spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Autoindent settings
set autoindent
set smartindent
set smarttab

" Don't add empty newlines at the end of files
set binary
set noeol

" UNIX format for end of lines
set fileformat=unix                    " file mode is unix

" Search tweaks
set ignorecase                         " case insensitive searching
set smartcase                          " but become case sensitive if you type uppercase characters
set magic                              " change the way backslashes are used in search patterns
"set incsearch                          " Do incremental searching

"set lazyredraw                         " redraw only when we need to
set esckeys                            " Allow cursor keys in insert mode
set backspace=indent,eol,start         " Allow backspacing over everything in insert mode
set ttyfast                            " Optimize for fast terminal connections
set history=2000                       " Keep 2000 lines of command line history

set modeline                           " Respect modelines embeded in buffers
set noerrorbells                       " Disable error bells
set nostartofline                      " Don’t reset cursor to start of line when moving around.

set foldenable                         " enable folding
set foldlevelstart=10                  " open most folds by default
set foldnestmax=10                     " 10 nested fold max
set foldmethod=indent                  " fold based on indent level
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
highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" Set the highlight colors of matching pairs to something more readable
highlight MatchParen ctermbg=black ctermfg=red cterm=bold

" Remap Leader key to comma
let mapleader=","

" Remove All the Trailing Whitespaces
"nnoremap <leader>W :%s,\s\+$,,<cr>:let @/=''<cr>

" Use <Leader>> and <Leader>< to page between buffers
noremap <silent><Leader>< :bp<cr>
noremap <silent><Leader>> :bn<cr>

" Use <Leader>s to sort a marked block
noremap <silent><Leader>s :sort<cr>

" Map ; to : and save a million keystrokes
nnoremap ; :

" Don't use Ex mode, use Q for formatting
map Q gq

" Join 6 lines
map <silent>1 :j6<cr><down>

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
    augroup templates
        " Load ~/.vim/skel/python for new .py files
        autocmd BufNewFile *.py silent! 0r ~/.vim/skel/python
        " Load ~/.vim/skel/<ext> for new <filename>.<ext> file
        "autocmd BufNewFile *.* silent! execute '0r ~/.vim/skel/'expand('<afile>:e')
        " Poor's man template system: replace some predefined @VAR@
        autocmd BufNewFile * %s/@FILENAME@/\=expand('<afile>:t')/ge
        autocmd BufNewFile * %s/@DAY@/\=strftime('%d')/ge
        autocmd BufNewFile * %s/@MONTH@/\=strftime('%m')/ge
        autocmd BufNewFile * %s/@YEAR@/\=strftime('%Y')/ge
        autocmd BufNewFile * %s/@TIME@/\=strftime('%H:%M:%S')/ge
        autocmd BufNewFile * %s/@ISODATE@/\=strftime('%F')/ge
        autocmd BufNewFile * %s/@FULLDATE@/\=strftime('%c')/ge
        "autocmd BufNewFile * %s/@ENCODING@/\=v:ctype/ge
    augroup END

    " Reload configuration upon saving (from vimbits.com)
    autocmd! BufWritePost .vimrc source %
    autocmd! BufWritePost vimrc source %

    " Enable file type automatic detection.
    filetype plugin indent on

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When opening a file, jump to the last known cursor position.
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    augroup localsettings
        au FileType xslt,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent tabstop=2 softtabstop=2 shiftwidth=2 expandtab
        au FileType tex set wrap tabstop=2 softtabstop=2 shiftwidth=2 expandtab
        " Conform to PEP8
        au FileType python set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
        au FileType python set cinwords=any,with,if,elif,else,for,while,try,except,finally,def,class
    augroup END
endif " has("autocmd")

" Show ifference between the current buffer and the file it was loaded from.
if !exists(":ShowDiff")
    command ShowDiff vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

" Abbreviations
ab _python #!/usr/bin/env python
ab _utf8 # -*- coding: utf-8 -*-
ab _vim # vim:ts=4:sts=4:sw=4:et