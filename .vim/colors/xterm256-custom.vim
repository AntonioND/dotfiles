hi clear

if exists('syntax_on')
    syntax reset
endif

if has('gui_running') || &t_Co != 256
  finish
endif

let colors_name = 'xterm256-custom'

function s:hi( group, attr, fg, bg)
  exec 'hi' a:group 'cterm='.a:attr 'ctermfg='.a:fg 'ctermbg='.a:bg 
endfunction

set background=dark

" Highlighting groups for standard colors

call s:hi( 'Normal'      , 'NONE'   , '15'   , '232'  )

call s:hi( 'Cursor'      , 'NONE'   , '232'  , '15'   )
call s:hi( 'CursorColumn', 'bold'   , 'NONE' , '234'  )
call s:hi( 'CursorLine'  , 'bold'   , 'NONE' , '234'  )
call s:hi( 'DiffAdd'     , 'NONE'   , '10'   , 'NONE' )
call s:hi( 'DiffChange'  , 'NONE'   , '190'  , 'NONE' )
call s:hi( 'DiffDelete'  , 'NONE'   , '196'  , 'NONE' )
call s:hi( 'DiffText'    , 'bold'   , '190'  , 'NONE' )
call s:hi( 'Directory'   , 'NONE'   , '14'   , 'NONE' )
call s:hi( 'ErrorMsg'    , 'NONE'   , '15'   , '1'    )
call s:hi( 'FoldColumn'  , 'NONE'   , '190'  , '4'    )
call s:hi( 'Folded'      , 'NONE'   , '190'  , '4'    )
call s:hi( 'IncSearch'   , 'NONE'   , '8'    , '4'    )
call s:hi( 'LineNr'      , 'NONE'   , '190'  , 'NONE' )
call s:hi( 'MatchParen'  , 'bold'   , '196'  , '236'  )
call s:hi( 'MoreMsg'     , 'bold'   , '10'   , 'NONE' )
call s:hi( 'NonText'     , 'NONE'   , '4'    , 'NONE' ) " eol, extends, precedes
call s:hi( 'Pmenu'       , 'NONE'   , '232'  , '8'    )
call s:hi( 'PmenuSel'    , 'NONE'   , 'NONE' , '4'    )
call s:hi( 'PmenuSbar'   , 'NONE'   , 'NONE' , '236'  )
call s:hi( 'PmenuThumb'  , 'NONE'   , 'NONE' , '15'   )
call s:hi( 'Question'    , 'NONE'   , '10'   , 'NONE' )
call s:hi( 'Search'      , 'NONE'   , '232'  , '6'    )
call s:hi( 'SignColumn'  , 'NONE'   , '5'    , '236'  )
call s:hi( 'SpecialKey'  , 'NONE'   , '14'   , 'NONE' ) " tab, trail
call s:hi( 'StatusLine'  , 'NONE'   , '4'    , '8'    )
call s:hi( 'StatusLineNC', 'reverse', 'NONE' , 'NONE' )
call s:hi( 'TabLineFill' , 'NONE'   , '232'  , '236'  )
call s:hi( 'TabLine'     , 'NONE'   , '232'  , '236'  )
call s:hi( 'TabLineSel'  , 'bold'   , 'NONE' , 'NONE' )
call s:hi( 'Title'       , 'NONE'   , '13'   , 'NONE' )
call s:hi( 'Visual'      , 'NONE'   , 'NONE' , '4'    )
call s:hi( 'VisualNOS'   , 'NONE'   , 'NONE' , '236'  )
call s:hi( 'WarningMsg'  , 'bold'   , '196'  , 'NONE' )
call s:hi( 'WildMenu'    , 'NONE'   , '5'    , '3'    )

call s:hi( 'Comment'      , 'NONE'  , '242'   , 'NONE' )
call s:hi( 'Constant'     , 'NONE'  , '190'  , 'NONE' )
call s:hi( 'Error'        , 'NONE'  , '15'   , '196'  )
call s:hi( 'Identifier'   , 'bold'  , '45'    , 'NONE' )
call s:hi( 'Ignore'       , 'NONE'  , '34'   , 'NONE' )
call s:hi( 'PreProc'      , 'NONE'  , '208'  , 'NONE' )
call s:hi( 'Special'      , 'bold'  , '22'   , 'NONE' )
call s:hi( 'Statement'    , 'bold'  , '160'  , 'NONE' )
call s:hi( 'Todo'         , 'NONE'  , '232'  , '190'  )
call s:hi( 'Type'         , 'NONE'  , '40'   , 'NONE' )
call s:hi( 'Underlined'   , 'NONE'  , '5'    , 'NONE' )

" Spelling highlighting groups.
call s:hi( 'SpellBad'  , 'bold,underline', 'NONE', 'NONE' )
call s:hi( 'SpellCap'  , 'bold'          , 'NONE', 'NONE' )
call s:hi( 'SpellLocal', 'underline'     , 'NONE', 'NONE' )
call s:hi( 'SpellRare'  ,'underline'     , 'NONE', 'NONE' )

delfunction s:hi
