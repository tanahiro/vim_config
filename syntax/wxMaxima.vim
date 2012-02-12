" Vim syntax file
" maxima_wxm.vim - wxMaxima 
"
" Language:	wxMaxima
" Maintainer:	Hiroyuki Tanaka
" Last Change:	10-Jun-2009.

scriptencoding utf-8

""definition
syntax match maximaDefinition display "^\S\{-}:"
syntax match maximaDefinition display "^\S\{-}:="

""comment
syntax match maximaComment    display "/\*\(\s\|\S\|\n\)\{-}\*/"
syntax match maximaStatement  display "^/\* \[\(\s\|\S\)\{-}\]\s*\*/"
syntax match maximaStatement2 display "\"Created with wxMaxima\"\$"

""constant
syntax match maximaConstant display "%i"
syntax match maximaConstant display "%pi"
syntax match maximaConstant display "%e"

""keyword
syntax keyword maximaKeyword true false
syntax keyword maximaKeyword and or not
syntax keyword maximaKeyword real imaginary
syntax keyword maximaKeyword rational irrational
syntax keyword maximaKeyword integer noninteger
syntax keyword maximaKeyword even odd

syntax keyword maximaKeyword all
syntax keyword maximaKeyword for thru do
syntax keyword maximaKeyword step while unless
syntax keyword maximaKeyword if elseif then

syntax keyword maximaKeyword letrat


""function
syntax keyword maximaFunction kill

syntax keyword maximaFunction carg realpart imagpart abs
syntax keyword maximaFunction polarform rectform

syntax keyword maximaFunction matrix zeromatrix
syntax keyword maximaFunction transpose invert
syntax keyword maximaFunction eigenvalues determinant

syntax keyword maximaFunction rhs lhs
syntax keyword maximaFunction coeff expand
syntax keyword maximaFunction rat ratsimp ratcoef ratdenom
syntax keyword maximaFunction factor 
syntax keyword maximaFunction ev solve eliminate
syntax keyword maximaFunction denom num

syntax keyword maximaFunction hipow
syntax keyword maximaFunction sqrt

syntax keyword maximaFunction let letsimp

syntax keyword maximaFunction algsys  

syntax keyword maximaFunction float

syntax keyword maximaFunction is equal
syntax keyword maximaFunction declare
syntax keyword maximaFunction assume

syntax keyword maximaFunction load
syntax keyword maximaFunction display
syntax keyword maximaFunction with_stdout grind


hi def link maximaKeyword    type
hi def link maximaComment    comment
hi def link maximaStatement  conditional
hi def link maximaStatement2 constant
hi def link maximaFunction   function
hi def link maximaDefinition preproc
hi def link maximaConstant   type

set autoindent

"syntax match memoLabelUpper display "^[A-Z]\+\>\(\s\|\d\|$\)"
"syntax match memoLabelDate display "^\d\+-\k\+-\d\+\(\.\)\="
"syntax match memoLabelParenthesis display "^\s*\[\(\S\|\s\|\n\)\{-}\]$"
"syntax match memoLabelParenthesis display "\(^\s*\)\@<=([^)]*)"
"syntax match memoListItem display "^\s*[-+*]\s\+\S.*$"
"syntax match memoListItem display "^\s*[*]\s\+\S.*$"
"syntax match memoListOrderedItem display "^\s*\d\+[.):]\s\+\S.*$"
"syntax match memoComment display '^\s*#\s\+\S.*$'
"syntax match memoCommentTitle display '^\s*\u\a*\(\s\+\u\a*\)*:'
"syntax match memoCommentVim display '^\s*vi\(m\)\=:[^:]*:'
"hi def link Statement
"hi def link Todo
"hi def link WarningMsg
"hi def link Error
"hi def link Special
"hi def link Underlined
"hi def link Title
"hi def link Constant
"hi def link Identifier

let b:current_syntax = "wxMaxima"
