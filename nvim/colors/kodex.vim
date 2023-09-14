:highlight clear
if version > 580
   hi clear
   if exists("syntax_on")
       syntax reset
   endif
endif
let colors_name='kodex'

" Color table
:hi! Black ctermfg=0
:hi! Red ctermfg=1
:hi! Green ctermfg=2
:hi! Yellow ctermfg=3
:hi! Blue ctermfg=4
:hi! Purple ctermfg=5
:hi! Cyan ctermfg=6
:hi! White ctermfg=7

:hi Normal ctermfg=White
:hi Comment ctermfg=red
:hi Special ctermfg=white
:hi String ctermfg=blue
:hi Function ctermfg=yellow
:hi Structure ctermfg=yellow
:hi Statement ctermfg=yellow
:hi Identifier ctermfg=green cterm=none
:hi Operator ctermfg=yellow
:hi Constant ctermfg=darkred
:hi Define ctermfg=yellow
:hi Type ctermfg=yellow
:hi PreProc ctermfg=yellow
:hi Error cterm=underline ctermfg=red ctermbg=none
:hi MatchParen ctermfg=cyan ctermbg=none

:hi Directory ctermfg=blue cterm=bold

" php
:hi link phpVarSelector Identifier

" StatusLine

:hi StatusLine ctermbg=red

" Cursor
:hi CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE

" Line numbers
:hi LineNr guifg=grey50 ctermfg=grey


function! ResetCursorLineNrColor()
    hi CursorLineNR guifg=grey50 ctermfg=grey cterm=bold
endfunction

if exists("g:kodex#color_cursor_line_insert")

function! CursorLineNrColorInsert()
    let mode = v:insertmode
    " Insert mode: blue
    if mode == "i"
        hi CursorLineNr ctermfg=yellow
    " Replace mode: red
    elseif mode == "r"
        hi CursorLineNr ctermfg=red
    else
        hi CursorLineNr ctermfg=green
    endif
endfunction

autocmd InsertEnter * call CursorLineNrColorInsert()
autocmd InsertLeave * call ResetCursorLineNrColor()

endif

:call ResetCursorLineNrColor()
