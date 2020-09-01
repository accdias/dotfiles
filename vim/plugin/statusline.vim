" ~/.vim/plugins/statusline.vim
"
" Author: Antonio Dias <accdias@gmail.com>
"
set showmode                           " Show mode in status bar
set laststatus=2                       " Use 2 lines for the status bar
set statusline=                        " Clear all settings
set statusline=%*\ %03n%*              " Buffer number
set statusline+=\ ╲                    " Separator
set statusline+=%2*%{&mod?'\ !':''}%*  " Custom modified flag
set statusline+=\ %<%F                 " File name full path
set statusline+=\ %y                   " File type
set statusline+=%r                     " Flag read-only
set statusline+=%h                     " Flag help buffer
set statusline+=%w                     " Flag preview window
set statusline+=[%{&ff}]               " New line format
set statusline+=[%{&fenc?&fenc:&enc}]  " File enconding
set statusline+=%{&paste?'[paste]':''} " Custom paste indicator
set statusline+=%=                     " Left and right division
set statusline+=\ ╲                    " Separator
set statusline+=\ char:%03.3b          " ASCII code for char under cursor
set statusline+=\ 0x%02.2B             " ASCII code in hexadecimal
set statusline+=\ ╲                    " Separator
set statusline+=\ line:%l              " Line number
set statusline+=\ ╲                    " Separator
set statusline+=\ col:%v               " Column number
set statusline+=\ ╲                    " Separator
set statusline+=\ %p%%                 " File percentual position
set statusline+=\ %*                   " Restore normal highlight with %* or %0*
