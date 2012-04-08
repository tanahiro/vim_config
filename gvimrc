""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .gvimrc
"
" License: Public Domain   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" font {{{
if has('win32')
  set guifont=MS_Gothic:h10:cSHIFTJIS
  set linespace=1
elseif has('gui_macvim')
  "set guifont=Osaka-等幅:h11
  "set guifont=Courier:h11
  set guifont=Inconsolata:h12
  set guifontwide=Takaoゴシック:h11
elseif has('xfontset')
  set guifontset=a14,r14,k14
elseif has ('gui_gtk2')
  set guifont=Inconsolata\ 11 
  "set guifontwide=Takaoゴシック\ 11
endif
"}}}

"" window {{{
set columns=80
if has('gui_macvim')
  set lines=55
else
  set lines=70
endif
set cmdheight=1

"" toolbar
set guioptions-=T

"" color
colorscheme tanahiro

"" transparency
set transparency=8

"" }}}

"" IME {{{
if has('multi_byte_ime') || has('xim')
  "set iminsert=0 imsearch=0
  "" XIM input start key
  "if has('xim') && has('GUI_GTK')
  "  set imactivatekey=s-space
  "endif
  "" do not keep the state of IME in insert mode
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
if has('gui_macvim')
  set iminsert
  set noimdisableactivate
endif

"" }}}

"" mouse {{{
"" mouse mode (all modes)
set mouse=a
set nomousefocus
" hides mouse pointer in input mode
set nomousehide
"" }}}

"" visual bell
set vb t_vb=

"" gvimrc_local.vim  {{{
if 1 && filereadable($VIM . '/gvimrc_local.vim')
  source $VIM/gvimrc_local.vim
  if exists('g:gvimrc_local_finish') && g:gvimrc_local_finish != 0
    finish
  endif
endif
" }}}

" vim: fileencoding=utf-8 foldmethod=marker
