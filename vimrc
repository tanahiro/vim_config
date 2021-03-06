""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" vim: fileencoding=utf-8 foldmethod=marker
"
" Maintainer: Hiroyuki Tanaka <hryktnk@gmail.com>
" License: Public Domain   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Dirs {{{
if has("win32")
  let g:vim_home = expand("~/vimfiles/")
else
  let g:vim_home = expand("~/.vim/")
endif

" }}}
"" dein {{{
let s:dein_dir = g:vim_home.'dein/'
let g:vim_plugin_dir = g:vim_home.'dein/repos/'

let &rtp .= ','.expand(s:dein_dir.'repos/dein.vim')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#local(g:vim_plugin_dir)
  call dein#local(g:vim_home.'local-plugins')

  if dein#check_install()
    call dein#install()
  endif

  call dein#end()
  call dein#save_state()
endif

silent! execute 'helptags' s:dein_dir.'doc/'
" }}}
"" mode {{{
filetype plugin on
syntax on
"" Use Vim defaults
set nocompatible
"" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,<50
"" keep 50 lines of command line history
set history=50
" }}}
"" defautl macros {{{
"" match with if/end
runtime macros/matchit.vim
" }}}
"" encoding {{{
set encoding=utf-8
" }}}
"" indent {{{
filetype indent on
"" number of spaces that a <Tab> counts for
set tabstop=2
"" expands a <Tab> to spaces
set expandtab
"" number of spaces for each step of indent
set shiftwidth=2
"" indents automaticaly
set autoindent
"" smartindent
set smartindent
"" number of spaces that a <Tab> counts for while editing
set softtabstop=2
"" }}}
"" appearance {{{
"" if to show line number
set nonumber
"" if to show <Tab> and end of line
set nolist
"" long lines wrap
set wrap
"" show matched bracket
set showmatch
"" show the mode (Insert, Replase or Visual) of the current buffer
set showmode
"" shows a status line
set laststatus=2
"" shows command-lin in status line
set showcmd
"" height of command-line
set cmdheight=1
"" shows title of the window on terminal
set title
"" title shown on terminal
set titlestring=%f\ %M%(\ @%{hostname()}:%<%F%)
" show the cursor position all the time
set ruler
"" bell
set visualbell t_vb=
"" multi-byte characters
set ambiwidth=double
"" line at 80th char
set colorcolumn=80
"" }}}
"" edit {{{
"" allows backspacing over everything in insert mode
set backspace=2
"" uses enhanced mode for command-line completion
set wildmenu
"" width of a line. "0" mean a line is not broken
set textwidth=0
"" format option for multi-byte
set formatoptions+=mM
"" does not use octal format
set nrformats-=octal
""}}}
"" color {{{
"" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set hlsearch
  set background=light
  let g:solarized_termtrans=1
  colorscheme solarized
endif
"" }}}
"" search {{{
"" seraches wrap around the end of the file
set wrapscan
set ignorecase
set smartcase
set incsearch
"" }}}
"" other set options {{{
"" do not make buckup file
set nobackup
"" compelete
set wildmode=list:longest
"" do not create swap files
set noswapfile
"" Fileformat of new buffer always unix
set ffs=unix,dos
""}}}
"" move {{{
"" up-down motion on wraped lines
map <Up> gk
map <Down> gj
imap <Up> <Esc>gka
imap <Down> <Esc>gja
" }}}
"" some convinient features {{{
"" When editing a file, always jump to the last cursor position
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif
" }}}
"" vim -b : edit binary using xxd-format {{{
"" :e ++bin or :e ++nobin
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost * if &bin | silent %!xxd -g 1
  au BufReadPost * set ft=xxd | endif
  au BufWritePre * if &bin | %!xxd -r
  au BufWritePre * endif
  au BufWritePost * if &bin | silent %!xxd -g 1
  au BufWritePost * set nomod | endif
augroup END
" }}}
" {{{ " buffer
set hidden
" }}}
"" clipbaord {{{
set clipboard+=unnamed
"" Mac ClipBoard {{{
if has('unix')
  vmap <silent> sy :!pbcopy; pbpaste<CR>
  map <silent> sp <esc>o<esc>v:!pbpaste<CR>
endif
" }}}
" }}}
"" local vimrc {{{
if has ("win32")
  if filereadable(expand('~/_vimrc.local'))
    source ~/_vimrc.local
  endif
else
  if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
  endif
endif
" }}}
"" tex and vim-latex {{{
"" In text files, always limit the width of text to 78 characters
au BufNewFile,BUfRead *.tex setlocal textwidth=78
"" Spell check and word list
au BufNewFile,BufRead *.tex setlocal spell
if filereadable(expand(vim_home."spell/tex.utf-8.add"))
  au BufNewFile,BufRead *.tex let &l:spellfile=vim_home.'spell/en.utf-8.add'
  au BufNewFile,BufRead *.tex
        \ let &l:spellfile.=','.vim_home.'spell/tex.utf-8.add'
endif

let g:tex_flavor = "latex"
"" for windows user
set shellslash
""IMPORTANT: grep will sometimes skip displaying the file name if you
"" search in a singe file. This will confuse Latex-Suite. Set your grep
"" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'tex, pdf'
let g:Tex_FormatDependency_ps = 'dvi, ps'
if $TARGETOS == "MAC"
  let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
  let g:Tex_ViewRule_dvi = 'xdvi'
  let g:Tex_BibtexFlavor = 'bibtex'
  let g:Tex_ViewRule_pdf = "open -a preview"
elseif $TARGETOS == "LINUX"
  let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
  let g:Tex_CompileRule_pdf = 'pdflatex $*'
  let g:Tex_ViewRule_dvi = 'pxdvi'
  let g:Tex_BibtexFlavor = 'jbibtex'
  let g:Tex_ViewRule_pdf = 'acroread'
endif
let g:Tex_CompileRule_ps = 'dvipsk -D600 $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_IgnoredWarnings = 
  \'Underfull'."\n". 
  \'Overfull'."\n". 
  \'specifier changed to'."\n". 
  \'You have requested'."\n". 
  \'Missing number, treated as zero.'."\n".
  \'Text page %.%# contains only floats'."\n".
  \"Font shape \`JT1/gt/m/it\' undefined"."\n". 
  \"Font shape \`JY1/gt/m/it\' undefined"."\n". 
  \"Font shape \`JT1/mc/m/it\' undefined"."\n".
  \"Font shape \`JY1/mc/m/it\' undefined"."\n". 
  \"Font shape \`JT1/mc/bx/it\' undefined"."\n". 
  \"Font shape \`JY1/mc/bx/it\' undefined"."\n".
  \"Some font shapes were not available, defaults substituted"
  "\"LaTeX Font Warning: Some font shapes were not available, defaults substituted"
  "\'Citation %.%# undefined'
  "\'There were undefined references'."\n". 
let g:Tex_IgnoreLevel = 13
"" }}}
"" syntaxhighlighter {{{
function! Syntaxhighlighter()
  let s:javascript1="<script type=\"syntaxhighlighter\" class=\"brush: <++>\">"
  let s:javascript2="<![CDATA["
  let s:javascript3="]]></script>"
  return s:javascript1.s:javascript2."\<CR>".s:javascript3
endfunction
inoremap SYNTAXH <C-R>=Syntaxhighlighter()<CR><ESC>
"" }}}
"" autodate {{{
let autodate_format = '%Y-%m-%d'
" }}}
"" evervim {{{
if has("python")
  nmap <silent> <Leader>el <Plug>EvervimNotebookList
  noremap <Plug>EvervimNotebookList :EvervimNotebookList<CR>

  nmap <silent> <Leader>et <Plug>EvervimListTags
  noremap <Plug>EvervimListTags :EvervimListTags<CR>

  nmap <silent> <Leader>ec <Plug>EvervimCreateNote
  noremap <Plug>EvervimCreateNote :EvervimCreateNote<CR>

  let g:evervim_splitoption=''
endif
" }}}
"" spell check {{{
au FileType gitcommit set spell
au FileType markdown  set spell
" }}}
"" mmarkdown {{{
let g:mmarkdown_viewer = "firefox"
" }}}
"" im_control {{{
let IM_CtrlMode = 1

function! IMCtrl(cmd)
  let cmd = a:cmd
  if cmd == 'On'
    let res = system('ibus engine "mozc-jp"')
  elseif cmd == 'Off'
    let res = system('ibus engine "xkb:us::eng"')
  endif
  return ''
endfunction
" }}}
"" vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
" }}}
"" syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode" : "passive"}

let g:syntastic_python_pylint_exec = $HOME."/.pyenv/shims/pylint"
let g:syntastic_python_checkers = ["pylint"]

nmap <silent> <Leader>ss <plug>SyntasticCheck
noremap <Plug>SyntasticCheck :SyntasticCheck<CR>
"}}}
