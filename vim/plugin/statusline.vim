set laststatus=2
set statusline=
set statusline+=%1*%-52F\ 
set statusline+=%2*\ %{&ff=='unix'?'\\n':(&ff=='mac'?'\\r':'\\r\\n')}\ 
set statusline+=%3*\ %{&fenc!=''?&fenc:&enc}\ 
set statusline+=%1*\ %Y\ 
set statusline+=%4*\ %04l/%03c\ 
set statusline+=%2*\ 0x%04.4B\ 
set statusline+=%1*\ %-16{strftime(\"%Y-%m-%d\ %H:%M\")}\ 
set statusline+=%5*\ %-3m\ 

set showmode                           " show mode in status bar
set laststatus=2                       " use 2 lines for the status bar
set statusline=
set statusline=\ %03.3n                " buffer number
set statusline+=\ │                    " Separator
set statusline+=%{&mod?'\ !':''}       " Custom modified flag
set statusline+=\ %<%F                 " File name full path
set statusline+=\ %y                   " File type
set statusline+=%r                     " Flag read-only
set statusline+=%h                     " Flag help buffer
set statusline+=%w                     " Flag preview window
set statusline+=[%{&ff}]               " New line format
set statusline+=%{&paste?'[paste]':''} " Custom paste indicator
set statusline+=\ │                    " Separator
set statusline+=%=                     " Left and right division
set statusline+=\ │                    " Separator
set statusline+=\ char:%03.3b          " ASCII code for char under cursor
set statusline+=\ 0x%02.2B             " ASCII code in hexadecimal
set statusline+=\ │                    " Separator
set statusline+=\ line:%06.6l          " Line number
set statusline+=\ │                    " Separator
set statusline+=\ col:%03.3v           " Column number
set statusline+=\ │                    " Separator
set statusline+=\ %3.3P                " File percentual position
set statusline+=\                      " Separator

hi User1 guifg=#112605  guibg=#aefe7B gui=italic
hi User2 guifg=#391100  guibg=#d3905c gui=italic
hi User3 guifg=#292b00  guibg=#f4f597 gui=italic
hi User4 guifg=#051d00  guibg=#7dcc7d gui=italic
hi User5 guifg=#002600  guibg=#67ab6e gui=italic