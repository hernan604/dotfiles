hi clear
syntax reset
let g:colors_name = "hernan604-no-contrast"
if &background == "light"
    hi Boolean gui=NONE guifg=#707070 guibg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#f5f5f5
    hi Comment gui=NONE guifg=#969696 guibg=NONE
    hi Conceal gui=NONE guifg=#707070 guibg=NONE
    hi Conditional gui=NONE guifg=#4a4a4a guibg=NONE
    hi Constant gui=NONE guifg=#707070 guibg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#f5f5f5
    hi CursorLine gui=NONE guifg=NONE guibg=#f5f5f5
    hi CursorLineNr gui=NONE guifg=#969696 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#f0fff0
    hi DiffChange gui=NONE guifg=NONE guibg=#f5f5f5
    hi DiffDelete gui=NONE guifg=NONE guibg=#fff0f0
    hi DiffText gui=NONE guifg=NONE guibg=#e3e3e3
    hi Directory gui=NONE guifg=#4a4a4a guibg=NONE
    hi Error gui=NONE guifg=NONE guibg=#fff0f0
    hi ErrorMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi FoldColumn gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Folded gui=NONE guifg=#969696 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#e3e3e3
    hi LineNr gui=NONE guifg=#c2c2c2 guibg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#e3e3e3
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Normal gui=NONE guifg=#000000 guibg=#ffffff
    hi Number gui=NONE guifg=#707070 guibg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#f5f5f5
    hi PmenuSbar gui=NONE guifg=NONE guibg=#ededed
    hi PmenuSel gui=NONE guifg=NONE guibg=#e3e3e3
    hi PmenuThumb gui=NONE guifg=NONE guibg=#dbdbdb
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#ededed
    hi SignColumn gui=NONE guifg=#c2c2c2 guibg=NONE
    hi Special gui=NONE guifg=#707070 guibg=NONE
    hi SpecialKey gui=NONE guifg=#c2c2c2 guibg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#fff0f0
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#f0fff0
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#ededed
    hi Statement gui=NONE guifg=#4a4a4a guibg=NONE
    hi StatusLine gui=NONE guifg=#262626 guibg=#ededed
    hi StatusLineNC gui=NONE guifg=#969696 guibg=#ededed
    hi StorageClass gui=NONE guifg=#4a4a4a guibg=NONE
    hi String gui=NONE guifg=#707070 guibg=NONE
    hi TabLine gui=NONE guifg=#969696 guibg=#ededed
    hi TabLineFill gui=NONE guifg=NONE guibg=#ededed
    hi TabLineSel gui=NONE guifg=#262626 guibg=#ededed
    hi Title gui=NONE guifg=#707070 guibg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE
    hi Type gui=NONE guifg=#4a4a4a guibg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#e3e3e3 guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#e3e3e3
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi WildMenu gui=NONE guifg=NONE guibg=#d1d1d1
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE
elseif &background == "dark"
    hi Boolean gui=bold guifg=#79396a guibg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#141414
    hi Comment gui=italic guifg=#76487a guibg=NONE
    hi Conceal gui=NONE guifg=#666666 guibg=NONE
    hi Conditional gui=italic guifg=#6a393e guibg=NONE
    hi Constant gui=NONE guifg=#666666 guibg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#141414
    hi CursorLine gui=NONE guifg=NONE guibg=#222020
    hi CursorLineNr gui=NONE guifg=#595959 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#0b190b
    hi DiffChange gui=NONE guifg=NONE guibg=#141414
    hi DiffDelete gui=NONE guifg=NONE guibg=#190b0b
    hi DiffText gui=NONE guifg=NONE guibg=#292929
    hi Directory gui=NONE guifg=#737373 guibg=#2b2b2b
    hi Error gui=NONE guifg=NONE guibg=#190b0b
    hi ErrorMsg gui=NONE guifg=NONE guibg=#190b0b
    hi FoldColumn gui=NONE guifg=#4d4d4d guibg=NONE
    hi Folded gui=NONE guifg=#a44747 guibg=#433737
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#292929
    hi LineNr gui=NONE guifg=#4a5078 guibg=#171717
    hi MatchParen gui=NONE guifg=NONE guibg=#292929
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#4d4d4d guibg=NONE
    hi Normal gui=NONE guifg=#3a4673 guibg=#171717
    hi Number gui=bold guifg=#7a3333 guibg=NONE
    hi Pmenu gui=NONE guifg=#525252 guibg=#252c55
    hi PmenuSbar gui=NONE guifg=NONE guibg=#2e192f
    hi PmenuSel gui=NONE guifg=#915a90 guibg=#2e192f
    hi PmenuThumb gui=NONE guifg=#915a90 guibg=#915a90
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#1f1f1f
    hi SignColumn gui=NONE guifg=#4d4d4d guibg=NONE
    hi Special gui=NONE guifg=#38697b guibg=NONE
    hi SpecialKey gui=NONE guifg=#4d4d4d guibg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#190b0b
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#0b190b
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#1f1f1f
    hi Statement gui=bold guifg=#385a75 guibg=NONE
    hi StatusLine gui=NONE guifg=#525252 guibg=#252c55
    hi StatusLineNC gui=NONE guifg=#595959 guibg=#1f1f1f
    hi StorageClass gui=italic guifg=#8b7e51 guibg=NONE
    hi String gui=NONE guifg=#6d4e31 guibg=NONE
    hi TabLine gui=bold guifg=#525252 guibg=#252c55
    hi TabLineFill gui=NONE guifg=#8c8c8c guibg=#252c55
    hi TabLineSel gui=italic guifg=#915a90 guibg=#2e192f
    hi Title gui=NONE guifg=#666666 guibg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE
    hi Type gui=italic guifg=#8e4848 guibg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#292929 guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#292929
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#190b0b
    hi WildMenu gui=NONE guifg=#915a90 guibg=#2e192f
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE
endif
