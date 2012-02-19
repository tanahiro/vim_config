""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
"
" License: Public Domain   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" pathogen
"" 'runtimepath' is modified to include ~/.vim/bundle/*
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin on

"" encoding
set encoding=utf-8

"" Use Vim defaults
set nocompatible

"" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,<50
"" keep 50 lines of command line history
set history=50

"" When editing a file, always jump to the last cursor position
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

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
"" shows line number
set nonumber
"" shows <Tab> and end of line
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

"" other set options {{{
"" seraches wrap around the end of the file
set wrapscan
"" do not make buckup file
set nobackup
""}}}

"" color {{{
"" Switch syntax highlighting on, when the terminal has colors
"" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
 syntax on
 set hlsearch
  "" color setting
  colorscheme tanahiro
endif

"" }}}

"" up-down motion on wraped lines
map <Up> gk
map <Down> gj
imap <Up> <Esc>gka
imap <Down> <Esc>gja

"" vim-latex {{{
let g:tex_flavor = "latex"
"" for windows user
set shellslash
""IMPORTANT: grep will sometimes skip displaying the file name if you
"" search in a singe file. This will confuse Latex-Suite. Set your grep
"" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

let g:Tex_DefaultTargetFormat = 'dvi'
let g:Tex_FormatDependency_pdf = 'dvi, pdf'
let g:Tex_FormatDependency_ps = 'dvi, ps'
if $TARGETOS == "MAC"
  let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
  let g:Tex_ViewRule_dvi = 'xdvi'
  let g:Tex_BibtexFlavor = 'bibtex'
  let g:Tex_ViewRule_pdf = "open -a preview"
elseif $TARGETOS == "LINUX"
  let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
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

"" In text files, always limit the width of text to 78 characters
au BufNewFile,BUfRead *.tex set textwidth=78
"" }}}

""vim -b : edit binary using xxd-format
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | silent %!xxd -g 1
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | silent %!xxd -g 1
  au BufWritePost *.bin set nomod | endif
augroup END

"" set clipbaord
set clipboard+=unnamed

"" Mac ClipBoard
if has('unix')
  vmap <silent> sy :!pbcopy; pbpaste<CR>
  map <silent> sp <esc>o<esc>v:!pbpaste<CR>
endif


"" vimwiki {{{
if isdirectory(expand('~/Dropbox/'))
  let g:vimwiki_list = 
        \[{'path':'~/Dropbox/vimwiki/', 'path_html':'~/Dropbox/vimwiki_html/'}]
endif
" Toggle list itme on/off
map <leader>tt <Plug>VimwikiToggleListItem
nmap <leader>wh <Plug>VimwikiAll2HTML
noremap <Plug>VimwikiAll2HTML :VimwikiAll2HTML<CR>
let g:vimwiki_folding = 1
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

" vim: fileencoding=utf-8 foldmethod=marker