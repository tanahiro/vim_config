""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim color file
" vim: foldmethod=marker
"
" Maintainer: Hiroyuki Tanaka <hryktnk@gmail.com>
" Last Change: 2013-04-01
" License: Public Domain
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Hint {{{1
" [attr-list]
" bold, underline, reverse, italic, standout, (NONE)
"
" [basic color]
" 0:  black
" 1:  Dark Red
" 2:  Dark Green
" 3:  Dark Yellow
" 4:  Dark Blue
" 5:  Dark Magenta
" 6:  Dark Cyan
" 7:  Gray
" 8:  DarkGray
" 9:  Red
" 10: Green
" 11: Yellow
" 12: Blue
" 13: Magenta
" 14: Cyan
" 15: White
"
" [group]
" Comment
" Constant, String, Character, Number, Boolean, Float
" Identifier, Function
" Statement, Conditional, Repeat, Label, Operator, Keyword, Exception
" PreProc, Include, Define, Macro, PreCondit
" Type, StorageClass, Structure, Typedef
" Special, SpecialChar, Tag, Delimiter, SpecialComment, Debug
" Underlined
" Ignore
" Error
" Todo

"" Basic {{{1
set background=light
hi clear

if !has("gui_running")
  set t_Co=256
end

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif
let colors_name = "tanahiro"

let s:bg = 231

"" function set_clr{{{2
fun! <SID>set_clr(group, fg, bg, attr)
  let l:str = "hi ".a:group
  if a:fg != ""
    let l:str = l:str." guifg=".<SID>chclr(a:fg)." ctermfg=".a:fg
  endif
  if a:bg != ""
    let l:str = l:str." guibg=".<SID>chclr(a:bg)." ctermbg=".a:bg
  endif
  if a:attr != ""
    let l:str = l:str." gui=".a:attr." cterm=".a:attr
  endif

  execute l:str
  "execute "hi ".a:group." guifg=".a:fg." guibg=".a:bg." gui=".a:attr
endfun

"" function set_clr2{{{2
fun! <SID>set_clr2(group, fg, bg, attr, guisp)
  let l:str = "hi ".a:group
  if a:fg != ""
    let l:str = l:str." guifg=".<SID>chclr(a:fg)." ctermfg=".a:fg
  endif
  if a:bg != ""
    let l:str = l:str." guibg=".<SID>chclr(a:bg)." ctermbg=".a:bg
  endif
  if a:attr != ""
    let l:str = l:str." gui=".a:attr." cterm=".a:attr
  endif
  if a:guisp != ""
    let l:str = l:str." guisp=".<SID>chclr(a:guisp)
  endif

  execute l:str
  "execute "hi ".a:group." guifg=".a:fg." guibg=".a:bg." gui=".a:attr
endfun

"" function chclr {{{2
let s:c_base = [0x00, 0x5F, 0x87, 0xAF, 0xD7, 0xFF]
fun! <SID>chclr(color_num)
  if a:color_num >= 0 && a:color_num <= 15
    if a:color_num == 0 
      "" Black
      let l:rgb = "#000000"
    elseif a:color_num == 1
      "" Dark Red
      let l:rgb = "#CC0000"
    elseif a:color_num == 2
      "" Dark Green
      let l:rgb = "#4E9A06"
    elseif a:color_num == 3
      "" Dark Yellow
      let l:rgb = "#C4A000"
    elseif a:color_num == 4
      "" Dark Blue
      let l:rgb = "#3465A4"
    elseif a:color_num == 5
      "" Dark Magenta
      let l:rgb = "#75507B"
    elseif a:color_num == 6
      "" Dark Cyan
      let l:rgb = "#06989A"
    elseif a:color_num == 7
      "" Gray
      let l:rgb = "#D3D7CF"
    elseif a:color_num == 8
      "" Dark Gray
      let l:rgb = "#555753"
    elseif a:color_num == 9
      "" Red
      let l:rgb = "#EF2929"
    elseif a:color_num == 10
      "" Green
      let l:rgb = "#8AE234"
    elseif a:color_num == 11
      "" Yellow
      let l:rgb = "#FCE94F"
    elseif a:color_num == 12
      "" Blue
      let l:rgb = "#729FCF"
    elseif a:color_num == 13
      "" Magenta
      let l:rgb = "#AD7FA8"
    elseif a:color_num == 14
      "" Cyan
      let l:rgb = "#34E2E2"
    elseif a:color_num == 15
      "" White
      let l:rgb = "#EEEEEC"
    endif
  elseif a:color_num > 15 && a:color_num <= 231
    let l:c_x = a:color_num - 16
    let l:c_r = l:c_x/36
    let l:c_g = (l:c_x%36)/6
    let l:c_b = l:c_x%6
    let l:rgb = printf("#%06x",
          \s:c_base[l:c_r]*65536 + s:c_base[l:c_g]*256 + s:c_base[l:c_b])
  elseif a:color_num <= 255
    let l:c_x = 8 + (a:color_num - 232)*0xA
    let l:rgb = printf("#%06x", l:c_x*(65536 + 256 + 1))
  else
    let l:rgb = "#FFFFFF"
  endif

  return l:rgb
endfun

"" Normal {{{1
if has("gui_running")
  call <SID>set_clr("Normal",     0, s:bg, "NONE")
  call <SID>set_clr("Comment",    4, s:bg, "NONE")
  call <SID>set_clr("Constant",   2, s:bg, "NONE")
  call <SID>set_clr("String",     1, s:bg, "NONE")
  call <SID>set_clr("Identifier", 6, s:bg, "NONE")
  call <SID>set_clr("Statement",  3, s:bg, "NONE")
  call <SID>set_clr("PreProc",    5, s:bg, "NONE")
  call <SID>set_clr("Type",       2, s:bg, "NONE")
  call <SID>set_clr("Special",    5, s:bg, "NONE")
  call <SID>set_clr("Underlined", 5, s:bg, "underline")
  call <SID>set_clr("Ignore",     7, s:bg, "NONE")
else
  call <SID>set_clr("Normal",     0, "NONE", "NONE")
  call <SID>set_clr("Comment",    4, "NONE", "NONE")
  call <SID>set_clr("Constant",   2, "NONE", "NONE")
  call <SID>set_clr("String",     1, "NONE", "NONE")
  call <SID>set_clr("Identifier", 6, "NONE", "NONE")
  call <SID>set_clr("Statement",  3, "NONE", "NONE")
  call <SID>set_clr("PreProc",    5, "NONE", "NONE")
  call <SID>set_clr("Type",       2, "NONE", "NONE")
  call <SID>set_clr("Special",    5, "NONE", "NONE")
  call <SID>set_clr("Underlined", 5, "NONE", "underline")
  call <SID>set_clr("Ignore",     7, "NONE", "NONE")
endif
call <SID>set_clr("Error",      7, 9,    "bold")
call <SID>set_clr("Todo",       0, 11,   "NONE")

hi! link Character String
hi! link Number Constant
hi! link Boolean String
hi! link Float Number
hi! link Function Identifier
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Operator Statement
hi! link Keyword Statement
hi! link Exception Statement
hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

"" Search {{{1
call <SID>set_clr("IncSearch", "", 11, "NONE")
call <SID>set_clr("Search",    "", 11, "NONE")

"" Messages {{{1
call <SID>set_clr("ErrorMsg", 15, 9,    "bold")
call <SID>set_clr("MoreMsg",  2,  s:bg, "NONE")
call <SID>set_clr("ModeMsg",  0,  s:bg, "bold")
hi! link WarningMsg ErrorMsg
hi! link Question ModeMsg

"" Split area {{{1
call <SID>set_clr("StatusLine",   11, 69, "bold")
call <SID>set_clr("StatusLineNC", 15, 69, "NONE")
call <SID>set_clr("WildMenu",     69, 15, "underline")
hi! link VertSplit StatusLineNC

"" Diff {{{1
call <SID>set_clr("DiffText",   "", 229, "NONE")
call <SID>set_clr("DiffChange", "", 254, "NONE")
call <SID>set_clr("DiffAdd",    "", 195, "NONE")
call <SID>set_clr("DiffDelete", "", 229, "NONE")

"" Cursor {{{1
call <SID>set_clr("Cursor",       230, 27,  "NONE")
call <SID>set_clr("CursorIM",     230, 208, "NONE")
call <SID>set_clr("CursorColumn", "",  250, "NONE")
call <SID>set_clr("CursorLine",   "",  252, "underline")

"" Fold {{{1
call <SID>set_clr("Folded", 93, 189, "NONE")
hi! link FoldColumn Folded

"" Visual {{{1
call <SID>set_clr("Visual",    "", 194, "NONE")
call <SID>set_clr("VisualNOS", "", 194, "NONE")

"" Tabs {{{1
call <SID>set_clr("TabLine",     0,  7,  "underline")
call <SID>set_clr("TabLineFill", "", "", "reverse")
call <SID>set_clr("TabLineSel",  "", "", "bold")

"" Spell Checker {{{1
if v:version >= 700
  call <SID>set_clr2("SpellBad",    "", 12, "undercurl", 9)
  call <SID>set_clr2("SpellCap",    "", 9,  "undercurl", 12)
  call <SID>set_clr2("SpellRare",   "", 13, "undercurl", 13)
  call <SID>set_clr2("SpellLocale", "", 11, "undercurl", 6)
endif

"" Completion {{{1
cal <SID>set_clr("Pmenu",       "", 225, "NONE")
cal <SID>set_clr("PmenuSel",    "", 7,   "NONE")
cal <SID>set_clr("PmenuSbar",   "", 248, "NONE")
cal <SID>set_clr("PmenuThumb",  "", "",  "reverse")

"" Other {{{1
call <SID>set_clr("Directory",   4,   "",   "NONE")
call <SID>set_clr("LineNr",      124, "",   "NONE")
call <SID>set_clr("SpecialKey",  4,   "",   "NONE")
call <SID>set_clr("Title",       5,   "",   "NONE")
call <SID>set_clr("MatchParen",  "",  153,  "NONE")
call <SID>set_clr("ColorColumn", "",  224,  "NONE")
call <SID>set_clr("Conceal",     7,   242,  "NONE")
call <SID>set_clr("SignColumn",  4,   248,  "NONE")
if has("gui_running")
  call <SID>set_clr("NonText",     27,  s:bg, "NONE")
else
  call <SID>set_clr("NonText",     27,  "", "NONE")
endif
