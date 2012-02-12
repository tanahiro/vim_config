" Vim syntas file
" Kuka Robot Language
"
" Language: KRL

scriptencoding utf-8

"" keyword
syntax keyword KRLFunction     INI

syntax keyword KRLDeclarations DECL ENUM IMPORT IS STRUC

syntax keyword KRLMotion       CIRC CIRC_REL LIN LIN_REL PTP PTP_REL
syntax keyword KRLMotion       SPLINE SCIRC SLIN SPL

syntax keyword KRLProgramExec  CONTINUE EXIT FOR ENDFOR GOTO HALT IF THEN ENDIF
syntax keyword KRLProgramExec  LOOP ENDLOOP REPEAT UNTIL SWITCH CASE ENDSWITCH
syntax keyword KRLProgramExec  WAIT FOR SEC WHILE ENDWHILE

syntax keyword KRLIO           ANIN ANOUT DIGIN PULSE SIGNAL

syntax keyword KRLSubFunc      RETURN

syntax keyword KRLInterrupt    BRAKE INTERRUPT RESUME

syntax keyword KRLPathSwitch   TRIGGER WHEN DISTANCE PATH

syntax keyword KRLSystemFunc   VARSTATE

syntax keyword KRLBoolean      TRUE FALSE

syntax keyword KRLKeywords     AXIS BOOL CHAR CAST_FOM CAST_TO
syntax keyword KRLKeywords     CCLOSE CHANNEL CIODTL CONFIRM CONST COPEN
syntax keyword KRLKeywords     CREAD CWRITE DEF DEFAULT DEFDAT DEFFCT
syntax keyword KRLKeywords     E6AXIS E6POS END ENDDAT ENDFCT EXT EXTFCT FRAME
syntax keyword KRLKeywords     GLOBAL MAXIMUM MINIMUM POS PRIO PUBLIC
syntax keyword KRLKeywords     SREAD SWRITE REAL

syntax keyword KRLKeywords     C_PTP C_DIS C_ORI C_VEL
syntax keyword KRLKeywords     CA ON OFF DELAY
syntax keyword KRLKeywords     SIGNAL
syntax keyword KRLKeywords     ENABLE DISABLE

syntax match   KRLKeywords display "\$\w*" "system variable
syntax match   KRLKeywords display "&\w*"
syntax match   KRLKeywords display "#\w*"

syntax match   KRLOperator     "\%([+-]\)"
syntax match   KRLOperator     "\%(=\|==\)"

""comment
syntax match KRLComment    display ";.*\n"

"" folding
syntax match KRLFoldBegin  display ";FOLD"
syntax match KRLFoldEnd    display ";ENDFOLD"

"" string
syntax match KRLString      display "\".*\""

hi def link KRLComment      Comment

hi def link KRLFunction     Function

hi def link KRLKeywords     Keyword
hi def link KRLDeclarations Define
hi def link KRLMotion       Keyword
hi def link KRLProgramExec  Repeat
hi def link KRLIO           Keyword
hi def link KRLSubFunc      Keyword
hi def link KRLInterrupt    Keyword
hi def link KRLPathSwitch   Keyword
hi def link KRLSystemFunc   Keyword
hi def link KRLBoolean      Boolean
hi def link KRLOperator     Operator

hi def link KRLFoldBegin    Comment
hi def link KRLFoldEnd      Comment

hi def link KRLString       String


let b:current_syntax = "KRL"
