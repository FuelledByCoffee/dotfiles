" Maintainer: Johannes Eckhoff <j.eckhoff@gmail.com

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='primary'

hi Normal guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Comment guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Constant guifg=#3ac8c5 ctermfg=80 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Quote guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Float guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Label guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Operator guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Exception guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Include guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Define guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Title guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Macro guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Error guifg=#c91b00 ctermfg=160 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi Todo guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=bold,italic cterm=bold,italic
hi Underlined guifg=#3bffff ctermfg=87 gui=underline cterm=underline
hi Cursor guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#2c323c ctermbg=236 gui=NONE cterm=NONE
hi CursorLineNr guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi SignColumn guifg=NONE ctermfg=NONE guibg=#202020 ctermbg=234 gui=NONE cterm=NONE
hi Conceal guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#2c323c ctermbg=236 gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#2c323c ctermbg=236 gui=NONE cterm=NONE
hi Directory guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#1e1e1e ctermfg=234 guibg=#50ef2b ctermbg=82 gui=NONE cterm=NONE
hi DiffChange guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#c91b00 ctermfg=160 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#181a1f ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Folded guifg=#1e1e1e ctermfg=234 guibg=#707070 ctermbg=242 gui=NONE cterm=NONE
hi FoldColumn guifg=#1e1e1e ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=#ffdd00 ctermfg=220 guibg=#6272a4 ctermbg=61 gui=NONE cterm=NONE
hi LineNr guifg=#707070 ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi NonText guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#f3f3f3 ctermfg=255 guibg=#282c34 ctermbg=236 gui=NONE cterm=NONE
hi PmenuSel guifg=#1e1e1e ctermfg=234 guibg=#ffa026 ctermbg=214 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#3b4048 ctermbg=238 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#f3f3f3 ctermbg=255 gui=NONE cterm=NONE
hi Question guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#1e1e1e ctermfg=234 guibg=#ffdd00 ctermbg=220 gui=NONE cterm=NONE
hi Search guifg=#1e1e1e ctermfg=234 guibg=#ffdd00 ctermbg=220 gui=NONE cterm=NONE
hi SpecialKey guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#c91b00 ctermfg=160 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpellCap guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#f3f3f3 ctermfg=255 guibg=#2c323c ctermbg=236 gui=NONE cterm=NONE
hi StatusLineNC guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StatusLineTerm guifg=#f3f3f3 ctermfg=255 guibg=#2c323c ctermbg=236 gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#2c323c ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineSel guifg=#f3f3f3 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#202020 ctermbg=234 gui=NONE cterm=NONE
hi Terminal guifg=#f3f3f3 ctermfg=255 guibg=#1e1e1e ctermbg=234 gui=NONE cterm=NONE
hi Visual guifg=#1e1e1e ctermfg=234 guibg=#ffa026 ctermbg=214 gui=NONE cterm=NONE
hi VisualNOS guifg=#3e4452 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#1e1e1e ctermfg=234 guibg=#3bffff ctermbg=87 gui=NONE cterm=NONE
hi EndOfBuffer guifg=#1e1e1e ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSError guifg=#c91b00 ctermfg=160 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctDelimiter guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctBracket guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctSpecial guifg=#5050ff ctermfg=63 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstant guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstBuiltin guifg=#3ac8c5 ctermfg=80 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstMacro guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStringRegex guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSString guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStringEscape guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSCharacter guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNumber guifg=#00c3ff ctermfg=45 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSBoolean guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFloat guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSAnnotation guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSAttribute guifg=#3ac8c5 ctermfg=80 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNamespace guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFuncBuiltin guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFunction guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFuncMacro guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameter guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameterReference guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSMethod guifg=#10bf0b ctermfg=34 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSField guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSProperty guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstructor guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConditional guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSRepeat guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLabel guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeyword guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordFunction guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordOperator guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSOperator guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSException guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSType guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTypeBuiltin guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi TSStructure guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSInclude guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariable guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariableBuiltin guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSText guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStrong guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSEmphasis guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSUnderline guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTitle guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLiteral guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSURI guifg=#ffff00 ctermfg=226 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTag guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTagDelimiter guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimFunc guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimFuncName guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimUsrCmd guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimString guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimMap guifg=#10bf0b ctermfg=34 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimMapLhs guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimMapRhs guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimBracket guifg=#707070 ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimCommand guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimOption guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimVar guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimEnvvar guifg=#3ac8c5 ctermfg=80 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi vimParenSep guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LspDiagnosticsSignWarning guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitconfigVariable guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitconfigSection guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitconfigAssignment guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitconfigDelim guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitCommitFirstLine guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi gitCommitSummary guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffIndexLine guifg=#3ac8c5 ctermfg=80 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffSubNmae guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffFile guifg=#3b4048 ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi makeCommands guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi makeSpecial guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi makeTarget guifg=#10bf0b ctermfg=34 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi makeIdent guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi makeStatement guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi makeDString guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi makeSString guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi makeSpecTarget guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi readlineVariable guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi readlineKeyword guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi sqlFold guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi sqlStatement guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi sqlString guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi sqlComment guifg=#3ac8c5 ctermfg=80 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi plug1 guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi plug2 guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi plugName guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlArg guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlBold guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi htmlEndTag guifg=#f3f3f3 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH1 guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH2 guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH3 guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH4 guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH5 guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlH6 guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlItalic guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi htmlLink guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi htmlSpecialChar guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlSpecialTagName guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTag guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTagN guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTagName guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi htmlTitle guifg=#f3f3f3 ctermfg=255 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownBlockquote guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi markdownBold guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownCode guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeBlock guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownCodeDelimiter guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownH1 guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH2 guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH3 guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH4 guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH5 guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownH6 guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi markdownHeadingDelimiter guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownHeadingRule guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownId guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownIdDeclaration guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownIdDelimiter guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownItalic guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi markdownLinkDelimiter guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownLinkText guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownListMarker guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownOrderedListMarker guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownRule guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownUrl guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi CocExplorerIndentLine guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferRoot guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileRoot guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferFullPath guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileFullPath guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferReadonly guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferModified guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerBufferNameVisible guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileReadonly guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileModified guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerFileHidden guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CocExplorerHelpLine guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi EasyMotionTarget guifg=#c91b00 ctermfg=160 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi EasyMotionTarget2First guifg=#c91b00 ctermfg=160 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi EasyMotionTarget2Second guifg=#c91b00 ctermfg=160 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi EasyMotionShade guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyNumber guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySelect guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyBracket guifg=#429df7 ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySpecial guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyVar guifg=#ff1dce ctermfg=200 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyPath guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyFile guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySlash guifg=#d8d8d2 ctermfg=188 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyHeader guifg=#ffa026 ctermfg=214 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifySection guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StartifyFooter guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKey guifg=#ad13f9 ctermfg=129 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeySeperator guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeyGroup guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WhichKeyDesc guifg=#3bffff ctermfg=87 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffAdded guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffRemoved guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffFileId guifg=#ffdd00 ctermfg=220 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi diffNewFile guifg=#50ef2b ctermfg=82 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffOldFile guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi debugPc guifg=NONE ctermfg=NONE guibg=#3bffff ctermbg=87 gui=NONE cterm=NONE
hi debugBreakpoint guifg=#ff2525 ctermfg=196 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse