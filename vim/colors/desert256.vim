" Vim color file
" Maintainer: Henry So, Jr. <henryso@panix.com>

" These are the colors of the "desert" theme by Hans Fugal with a few small
" modifications (namely that I lowered the intensity of the normal white and
" made the normal and nontext backgrounds black), modified to work with 88-
" and 256-color xterms.
"
" The original "desert" theme is available as part of the vim distribution or
" at http://hans.fugal.net/vim/colors/.
"
" The real feature of this color scheme, with a wink to the "inkpot" theme, is
" the programmatic approximation of the gui colors to the palettes of 88- and
" 256- color xterms.  The functions that do this (folded away, for
" readability) are calibrated to the colors used for Thomas E. Dickey's xterm
" (version 200), which is available at http://dickey.his.com/xterm/xterm.html.
"
" I struggled with trying to parse the rgb.txt file to avoid the necessity of
" converting color names to #rrggbb form, but decided it was just not worth
" the effort.  Maybe someone seeing this may decide otherwise...

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="desert256"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
    " functions {{{
    " returns an approximate grey index for the given grey level
    fun <SID>grey_number(x)
        if &t_Co == 88
            if a:x < 23
                return 0
            elseif a:x < 69
                return 1
            elseif a:x < 103
                return 2
            elseif a:x < 127
                return 3
            elseif a:x < 150
                return 4
            elseif a:x < 173
                return 5
            elseif a:x < 196
                return 6
            elseif a:x < 219
                return 7
            elseif a:x < 243
                return 8
            else
                return 9
            endif
        else
            if a:x < 14
                return 0
            else
                let l:n = (a:x - 8) / 10
                let l:m = (a:x - 8) % 10
                if l:m < 5
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual grey level represented by the grey index
    fun <SID>grey_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 46
            elseif a:n == 2
                return 92
            elseif a:n == 3
                return 115
            elseif a:n == 4
                return 139
            elseif a:n == 5
                return 162
            elseif a:n == 6
                return 185
            elseif a:n == 7
                return 208
            elseif a:n == 8
                return 231
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 8 + (a:n * 10)
            endif
        endif
    endfun

    " returns the palette index for the given grey index
    fun <SID>grey_color(n)
        if &t_Co == 88
            if a:n == 0
                return 16
            elseif a:n == 9
                return 79
            else
                return 79 + a:n
            endif
        else
            if a:n == 0
                return 16
            elseif a:n == 25
                return 231
            else
                return 231 + a:n
            endif
        endif
    endfun

    " returns an approximate color index for the given color level
    fun <SID>rgb_number(x)
        if &t_Co == 88
            if a:x < 69
                return 0
            elseif a:x < 172
                return 1
            elseif a:x < 230
                return 2
            else
                return 3
            endif
        else
            if a:x < 75
                return 0
            else
                let l:n = (a:x - 55) / 40
                let l:m = (a:x - 55) % 40
                if l:m < 20
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual color level for the given color index
    fun <SID>rgb_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 139
            elseif a:n == 2
                return 205
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 55 + (a:n * 40)
            endif
        endif
    endfun

    " returns the palette index for the given R/G/B color indices
    fun <SID>rgb_color(x, y, z)
        if &t_Co == 88
            return 16 + (a:x * 16) + (a:y * 4) + a:z
        else
            return 16 + (a:x * 36) + (a:y * 6) + a:z
        endif
    endfun

    " returns the palette index to approximate the given R/G/B color levels
    fun <SID>color(r, g, b)
        " get the closest grey
        let l:gx = <SID>grey_number(a:r)
        let l:gy = <SID>grey_number(a:g)
        let l:gz = <SID>grey_number(a:b)

        " get the closest color
        let l:x = <SID>rgb_number(a:r)
        let l:y = <SID>rgb_number(a:g)
        let l:z = <SID>rgb_number(a:b)

        if l:gx == l:gy && l:gy == l:gz
            " there are two possibilities
            let l:dgr = <SID>grey_level(l:gx) - a:r
            let l:dgg = <SID>grey_level(l:gy) - a:g
            let l:dgb = <SID>grey_level(l:gz) - a:b
            let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
            let l:dr = <SID>rgb_level(l:gx) - a:r
            let l:dg = <SID>rgb_level(l:gy) - a:g
            let l:db = <SID>rgb_level(l:gz) - a:b
            let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
            if l:dgrey < l:drgb
                " use the grey
                return <SID>grey_color(l:gx)
            else
                " use the color
                return <SID>rgb_color(l:x, l:y, l:z)
            endif
        else
            " only one possibility
            return <SID>rgb_color(l:x, l:y, l:z)
        endif
    endfun

    " returns the palette index to approximate the 'rrggbb' hex string
    fun <SID>rgb(rgb)
        let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
        let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
        let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

        return <SID>color(l:r, l:g, l:b)
    endfun

    " sets the highlighting for the given group
    fun <SID>X(group, fg, bg, attr)
        if a:fg != ""
            exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
        endif
        if a:bg != ""
            exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
        endif
        if a:attr != ""
            exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
        endif
    endfun
    " }}}

    call <SID>X("Normal", "cccccc", "", "")

    " highlight groups
    call <SID>X("Cursor", "708090", "f0e68c", "")
    "CursorIM
    "Directory
    "DiffAdd
    "DiffChange
    "DiffDelete
    "DiffText
    "ErrorMsg
    call <SID>X("VertSplit", "c2bfa5", "7f7f7f", "reverse")
    call <SID>X("Folded", "ffd700", "4d4d4d", "")
    call <SID>X("FoldColumn", "d2b48c", "4d4d4d", "")
    call <SID>X("IncSearch", "708090", "f0e68c", "")
    "LineNr
    call <SID>X("ModeMsg", "daa520", "", "")
    call <SID>X("MoreMsg", "2e8b57", "", "")
    call <SID>X("NonText", "addbe7", "000000", "bold")
    call <SID>X("Question", "00ff7f", "", "")
    call <SID>X("Search", "f5deb3", "cd853f", "")
    call <SID>X("SpecialKey", "9acd32", "", "")
    call <SID>X("StatusLine", "00afff", "000000", "reverse")
    call <SID>X("StatusLineNC", "00afff", "000000", "reverse")
    call <SID>X("User1", "00afff", "ffffff", "bold,reverse")
    call <SID>X("User2", "00afff", "ff0000", "bold,reverse")
    call <SID>X("Title", "cd5c5c", "", "")
    call <SID>X("Visual", "6b8e23", "f0e68c", "reverse")
    "VisualNOS
    call <SID>X("WarningMsg", "fa8072", "", "")
    "WildMenu
    "Menu
    "Scrollbar
    "Tooltip

    " syntax highlighting groups
    call <SID>X("Comment", "87ceeb", "", "")
    call <SID>X("Constant", "ffa0a0", "", "")
    call <SID>X("Identifier", "98fb98", "", "none")
    call <SID>X("Statement", "f0e68c", "", "bold")
    call <SID>X("PreProc", "cd5c5c", "", "")
    call <SID>X("Type", "bdb76b", "", "bold")
    call <SID>X("Special", "ffdead", "", "")
    "Underlined
    call <SID>X("Ignore", "666666", "", "")
    "Error
    call <SID>X("Todo", "ff4500", "eeee00", "")

    " delete functions {{{
    delf <SID>X
    delf <SID>rgb
    delf <SID>color
    delf <SID>rgb_color
    delf <SID>rgb_level
    delf <SID>rgb_number
    delf <SID>grey_color
    delf <SID>grey_level
    delf <SID>grey_number
    " }}}
else
    " color terminal definitions
    highlight SpecialKey    ctermfg=darkgreen
    highlight NonText       cterm=bold ctermfg=darkblue
    highlight Directory     ctermfg=darkcyan
    highlight ErrorMsg      cterm=bold ctermfg=7 ctermbg=1
    highlight IncSearch     cterm=NONE ctermfg=yellow ctermbg=green
    highlight Search        cterm=NONE ctermfg=grey ctermbg=blue
    highlight MoreMsg       ctermfg=darkgreen
    highlight ModeMsg       cterm=NONE ctermfg=brown
    highlight LineNr        ctermfg=3
    highlight Question      ctermfg=green
    highlight StatusLine    cterm=reverse
    highlight StatusLineNC  cterm=reverse
    highlight VertSplit     cterm=reverse
    highlight Title         ctermfg=5
    highlight Visual        cterm=reverse
    highlight VisualNOS     cterm=bold,underline
    highlight WarningMsg    ctermfg=1
    highlight WildMenu      ctermfg=0 ctermbg=3
    highlight Folded        ctermfg=darkgrey ctermbg=NONE
    highlight FoldColumn    ctermfg=darkgrey ctermbg=NONE
    highlight DiffAdd       ctermbg=4
    highlight DiffChange    ctermbg=5
    highlight DiffDelete    cterm=bold ctermfg=4 ctermbg=6
    highlight DiffText      cterm=bold ctermbg=1
    highlight Comment       ctermfg=darkcyan
    highlight Constant      ctermfg=brown
    highlight Special       ctermfg=5
    highlight Identifier    ctermfg=6
    highlight Statement     ctermfg=3
    highlight PreProc       ctermfg=5
    highlight Type          ctermfg=2
    highlight Underlined    cterm=underline ctermfg=5
    highlight Ignore        ctermfg=darkgrey
    highlight Error         cterm=bold ctermfg=7 ctermbg=1
    highlight User1         cterm=bold,reverse
    highlight User2         cterm=bold,reverse
endif

" vim: set fdl=0 fdm=marker:
