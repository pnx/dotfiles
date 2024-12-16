(comment) @comment

"=" @operator
[ "$" "{" "}" ] @punctuation.special

; types
(boolean) @constant
(number) @number
(string) @string
[(identifier) (variable)] @variable
(value) @string

