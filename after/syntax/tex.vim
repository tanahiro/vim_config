" Vim syntax file
" Language:     TeX
" Last Change:06-Jul-2010.
" vim: ts=8 fdm=marker

syn match  texRefZone   '\\Cite\%([tp]\*\=\)\=' nextgroup=texRefOption,texCite

