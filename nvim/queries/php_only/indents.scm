; extends

; Fix for phpdoc comments that don't align * properly.
; This is black magic. I came up with it myself but 
; i don't know why it works.
(ERROR
 "/" 
 "**"
 @indent.align)
