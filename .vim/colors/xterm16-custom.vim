hi clear

if exists('syntax_on')
    syntax reset
endif

let colors_name = 'xterm16-custom'

function s:hi( group, attr, fg, bg)
  exec 'hi' a:group 'cterm='.a:attr 'ctermfg='.a:fg 'ctermbg='.a:bg
                  \ 'gui='.a:attr 'guifg='.a:fg 'guibg='.a:bg
endfunction

set background=dark

" Highlighting groups for standard colors

if has('gui_running') || &t_Co == 256
  call s:hi( 'Normal'      , 'NONE'   , 'white'      , 'black'     )
else
  call s:hi( 'Normal'      , 'NONE'   , 'NONE'       , 'NONE'      )
endif

call s:hi( 'Cursor'      , 'NONE'   , 'black'      , 'white'     )
call s:hi( 'CursorColumn', 'NONE'   , 'NONE'       , 'darkgrey'  )
call s:hi( 'CursorLine'  , 'bold'   , 'NONE'       , 'darkgrey'  )
call s:hi( 'DiffAdd'     , 'NONE'   , 'green'      , 'NONE'      )
call s:hi( 'DiffChange'  , 'NONE'   , 'yellow'     , 'NONE'      )
call s:hi( 'DiffDelete'  , 'NONE'   , 'red'        , 'NONE'      )
call s:hi( 'DiffText'    , 'bold'   , 'yellow'     , 'NONE'      )
call s:hi( 'Directory'   , 'NONE'   , 'cyan'       , 'NONE'      )
call s:hi( 'ErrorMsg'    , 'NONE'   , 'white'      , 'darkred'   )
call s:hi( 'FoldColumn'  , 'NONE'   , 'yellow'     , 'darkblue'  )
call s:hi( 'Folded'      , 'NONE'   , 'yellow'     , 'darkblue'  )
call s:hi( 'IncSearch'   , 'NONE'   , 'grey'       , 'darkblue'  )
call s:hi( 'LineNr'      , 'NONE'   , 'yellow'     , 'NONE'      )
call s:hi( 'MatchParen'  , 'bold'   , 'red'        , 'darkgrey'  )
call s:hi( 'MoreMsg'     , 'bold'   , 'green'      , 'NONE'      )
call s:hi( 'NonText'     , 'NONE'   , 'darkblue'   , 'NONE'      ) " eol, extends, precedes
call s:hi( 'Pmenu'       , 'NONE'   , 'black'      , 'grey'      )
call s:hi( 'PmenuSel'    , 'NONE'   , 'NONE'       , 'darkblue'  )
call s:hi( 'PmenuSbar'   , 'NONE'   , 'NONE'       , 'darkgrey'  )
call s:hi( 'PmenuThumb'  , 'NONE'   , 'NONE'       , 'white'     )
call s:hi( 'Question'    , 'NONE'   , 'green'      , 'NONE'      )
call s:hi( 'Search'      , 'NONE'   , 'black'      , 'darkcyan'  )
call s:hi( 'SignColumn'  , 'NONE'   , 'darkmagenta', 'darkgrey'  )
call s:hi( 'SpecialKey'  , 'NONE'   , 'cyan'       , 'NONE'      ) " tab, trail
call s:hi( 'StatusLine'  , 'NONE'   , 'darkblue'   , 'grey'      )
call s:hi( 'StatusLineNC', 'reverse', 'NONE'       , 'NONE'      )
call s:hi( 'TabLineFill' , 'NONE'   , 'black'      , 'darkgrey'  )
call s:hi( 'TabLine'     , 'NONE'   , 'black'      , 'darkgrey'  )
call s:hi( 'TabLineSel'  , 'bold'   , 'NONE'       , 'NONE'      )
call s:hi( 'Title'       , 'NONE'   , 'magenta'    , 'NONE'      )
call s:hi( 'Visual'      , 'NONE'   , 'NONE'       , 'darkblue'  )
call s:hi( 'VisualNOS'   , 'NONE'   , 'NONE'       , 'darkgrey'  )
call s:hi( 'WarningMsg'  , 'bold'   , 'red'        , 'NONE'      )
call s:hi( 'WildMenu'    , 'NONE'   , 'darkmagenta', 'darkyellow')

call s:hi( 'Comment'      , 'NONE'  , 'blue'       , 'NONE'      )
call s:hi( 'Constant'     , 'NONE'  , 'yellow'     , 'NONE'      )
call s:hi( 'Error'        , 'NONE'  , 'white'      , 'red'       )
call s:hi( 'Identifier'   , 'NONE'  , 'darkcyan'   , 'NONE'      )
call s:hi( 'Ignore'       , 'NONE'  , 'darkgrey'   , 'NONE'      )
call s:hi( 'PreProc'      , 'NONE'  , 'cyan'       , 'NONE'      )
call s:hi( 'Special'      , 'NONE'  , 'darkgreen'  , 'NONE'      )
call s:hi( 'Statement'    , 'NONE'  , 'red'        , 'NONE'      )
call s:hi( 'Todo'         , 'NONE'  , 'black'      , 'yellow'    )
call s:hi( 'Type'         , 'NONE'  , 'green'      , 'NONE'      )
call s:hi( 'underlined'   , 'NONE'  , 'darkmagenta', 'NONE'      )

" Spelling highlighting groups.
call s:hi( 'SpellBad'  , 'bold,underline', 'NONE', 'NONE' )
call s:hi( 'SpellCap'  , 'bold'          , 'NONE', 'NONE' )
call s:hi( 'SpellLocal', 'underline'     , 'NONE', 'NONE' )
call s:hi( 'SpellRare'  ,'underline'     , 'NONE', 'NONE' )

delfunction s:hi
