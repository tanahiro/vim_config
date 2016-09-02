""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .gvimrc
" vim: fileencoding=utf-8 foldmethod=marker
"
" Maintainer: Hiroyuki Tanaka <hryktnk@gmail.com>
" Last Change: 2016-09-02.
" License: Public Domain   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" font {{{
if has('win32')
  set guifont=Inconsolata:h10
  set guifontwide=MigMix_1M:h10
elseif has('gui_macvim')
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
set background=light
colorscheme solarized

"" transparency
if has('gui_macvim')
  set transparency=8
endif

"" }}}
"" mouse {{{
"" mouse mode (all modes)
set mouse=a
set nomousefocus
" hides mouse pointer in input mode
set nomousehide
"" }}}
"" appearance {{{
"" visual bell
set vb t_vb=
" }}}
"" gvimrc_local.vim  {{{
if filereadable(expand('~/.gvimrc.local'))
  source ~/.gvimrc.local
endif
if filereadable(expand('~/_gvimrc_local'))
  source ~/_gvimrc_local
endif
" }}}

