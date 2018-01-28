" Vim colorscheme -- pythonista
" https://gihub.com/accdias/dotfiles/vim/colors/pythonista.vim
" See https://jonasjacek.github.io/colors for codes

let g:colors_name = "pythonista"

" Basic style
highlight Normal                    ctermfg=253 ctermbg=NONE cterm=NONE

" Validator plugin stuff
highlight ValidatorErrorSign        ctermfg=9   ctermbg=NONE cterm=bold
highlight ValidatorStyleErrorSign   ctermfg=9   ctermbg=NONE cterm=bold
highlight ValidatorStyleWarningSign ctermfg=11  ctermbg=NONE cterm=bold
highlight ValidatorWarningSign      ctermfg=11  ctermbg=NONE cterm=bold

" Syntax related stuff
highlight Boolean                   ctermfg=38  ctermbg=NONE cterm=bold
highlight Character                 ctermfg=142 ctermbg=NONE cterm=NONE
highlight Comment                   ctermfg=245 ctermbg=NONE cterm=NONE
highlight Conditional               ctermfg=81  ctermbg=NONE cterm=NONE
highlight Error                     ctermfg=160 ctermbg=NONE cterm=bold
highlight Float                     ctermfg=141 ctermbg=NONE cterm=NONE
highlight Function                  ctermfg=35  ctermbg=NONE cterm=NONE
highlight Include                   ctermfg=25  ctermbg=NONE cterm=bold
highlight Number                    ctermfg=141 ctermbg=NONE cterm=NONE
highlight Operator                  ctermfg=33  ctermbg=NONE cterm=NONE
highlight PreProc                   ctermfg=81  ctermbg=NONE cterm=NONE
highlight Special                   ctermfg=81  ctermbg=NONE cterm=NONE
highlight Statement                 ctermfg=209 ctermbg=NONE cterm=bold
highlight String                    ctermfg=217 ctermbg=NONE cterm=NONE
highlight Structure                 ctermfg=81  ctermbg=NONE cterm=NONE
highlight Todo                      ctermfg=196 ctermbg=226  cterm=bold

" Vim Stuff
highlight ColorColumn               ctermfg=201 ctermbg=NONE cterm=bold
highlight CursorLine                ctermfg=16  ctermbg=25   cterm=bold
highlight DiffAdd                   ctermfg=123 ctermbg=NONE cterm=bold
highlight DiffChange                ctermfg=196 ctermbg=NONE cterm=bold
highlight Directory                 ctermfg=81  ctermbg=NONE cterm=bold
highlight ErrorMsg                  ctermfg=160 ctermbg=NONE cterm=bold
highlight FoldColumn                ctermfg=67  ctermbg=16   cterm=NONE
highlight Folded                    ctermfg=67  ctermbg=16   cterm=bold
highlight IncSearch                 ctermfg=124 ctermbg=7    cterm=bold
highlight LineNr                    ctermfg=58  ctermbg=NONE cterm=NONE
highlight MatchParen                ctermfg=196 ctermbg=NONE cterm=bold
highlight NonText                   ctermfg=58  ctermbg=NONE cterm=NONE
highlight Pmenu                     ctermfg=81  ctermbg=16   cterm=NONE
highlight PmenuSbar                 ctermfg=81  ctermbg=16   cterm=NONE
highlight PmenuSel                  ctermfg=202 ctermbg=16   cterm=NONE
highlight PmenuThumb                ctermfg=81  ctermbg=16   cterm=NONE
highlight Search                    ctermfg=124 ctermbg=7    cterm=bold
highlight SignColumn                ctermfg=15  ctermbg=NONE cterm=bold
highlight SpecialKey                ctermfg=81  ctermbg=NONE cterm=bold
highlight SpellBad                  ctermfg=196 ctermbg=NONE cterm=bold
highlight SpellCap                  ctermfg=195 ctermbg=NONE cterm=bold
highlight SpellLocal                ctermfg=127 ctermbg=NONE cterm=bold
highlight SpellRare                 ctermfg=201 ctermbg=NONE cterm=bold
highlight StatusLine                ctermfg=16  ctermbg=25   cterm=bold
highlight StatusLineNC              ctermfg=16  ctermbg=8    cterm=bold
highlight StatusLineTerm            ctermfg=16  ctermbg=25   cterm=bold
highlight StatusLineTermNC          ctermfg=16  ctermbg=8    cterm=bold
highlight TabLine                   ctermfg=3   ctermbg=NONE cterm=NONE
highlight TabLineFill               ctermfg=46  ctermbg=NONE cterm=NONE
highlight TabLineSel                ctermfg=14  ctermbg=NONE cterm=bold
highlight User1                     ctermfg=16  ctermbg=25   cterm=bold
highlight User2                     ctermfg=9   ctermbg=25   cterm=bold
highlight VertSplit                 ctermfg=25  ctermbg=NONE cterm=NONE
highlight Visual                    ctermfg=196 ctermbg=229  cterm=bold
highlight WarningMsg                ctermfg=160 ctermbg=NONE cterm=bold
highlight WhitespaceEOL             ctermfg=196 ctermbg=196  cterm=NONE
highlight WildMenu                  ctermfg=25  ctermbg=117  cterm=bold

" General highlighting group links.
highlight! link diffAdded       DiffAdd
highlight! link diffRemoved     DiffDelete
highlight! link diffChanged     DiffChange
highlight! link StatusLineNC    StatusLine
highlight! link Title           Normal
highlight! link LineNr          NonText
highlight! link MoreMsg         Normal
highlight! link Question        DiffChange
highlight! link TabLine         StatusLineNC
highlight! link TabLineFill     StatusLineNC
highlight! link VimHiGroup      VimGroup

" Test the colorscheme
syntax match Comment            "\"__Comment.*"
syntax match Constant           "\"__Constant.*"
syntax match Cursor             "\"__Cursor.*"
syntax match CursorLine         "\"__CursorLine.*"
syntax match DiffAdd            "\"__DiffAdd.*"
syntax match DiffChange         "\"__DiffChange.*"
syntax match DiffText           "\"__DiffText.*"
syntax match DiffDelete         "\"__DiffDelete.*"
syntax match Folded             "\"__Folded.*"
syntax match Function           "\"__Function.*"
syntax match Identifier         "\"__Identifier.*"
syntax match IncSearch          "\"__IncSearch.*"
syntax match NonText            "\"__NonText.*"
syntax match Normal             "\"__Normal.*"
syntax match Pmenu              "\"__Pmenu.*"
syntax match PreProc            "\"__PreProc.*"
syntax match Search             "\"__Search.*"
syntax match Special            "\"__Special.*"
syntax match SpecialKey         "\"__SpecialKey.*"
syntax match Statement          "\"__Statement.*"
syntax match StatusLine         "\"__StatusLine.*"
syntax match StatusLineNC       "\"__StatusLineNC.*"
syntax match StatusLineTerm     "\"__StatusLineTerm.*"
syntax match StatusLineTermNC   "\"__StatusLineTermNC.*"
syntax match String             "\"__String.*"
syntax match Todo               "\"__Todo.*"
syntax match Type               "\"__Type.*"
syntax match Underlined         "\"__Underlined.*"
syntax match VertSplit          "\"__VertSplit.*"
syntax match Visual             "\"__Visual.*"

" Color examples for each match
"__Comment              /* this is a comment */
"__Constant             var = VALUE
"__Cursor               char under the cursor?
"__CursorLine           Line where the cursor is
"__DiffAdd              +line added from file.orig
"__DiffChange           line changed from file.orig
"__DiffText             actual changes on this line
"__DiffDelete           -line removed from file.orig
"__Folded               +--- 1 line : Folded line ---
"__Function             function sblah()
"__Identifier           Never ran into that actually...
"__IncSearch            Next search term
"__NonText              This is not a text, move on
"__Normal               Typical text goes like this
"__Pmenu                Currently selected menu item
"__PreProc              #define SHBLAH true
"__Search               This is what youʼre searching for
"__Special              true false NULL SIGTERM
"__SpecialKey           Never ran into that either
"__Statement            if else return for switch
"__StatusLine           Statusline of current windows
"__StatusLineNC         Statusline of other windows
"__StatusLineTerm       Statusline of current windows
"__StatusLineTermNC     Statusline of other windows
"__String               "Hello, World!"
"__Todo                 TODO: remove todos from source
"__Type                 int float char void unsigned uint32_t
"__Underlined           Anything underlined
"__VertSplit            :vsplit will only show ʼ | ʼ
"__Visual               Selected text looks like this
" vim:ts=8:sts=4:sw=4:et
