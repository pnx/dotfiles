; inherits: php

(scoped_call_expression
  scope: [
    (qualified_name (name) @class)
    (name) @class
  ] (#eq? @class "DB")
  name: (name) @method (#eq? @method "insert")
  arguments: (arguments
    . (argument [
                 (string (string_content) @injection.content(#set! injection.language "sql"))
                 (encapsed_string . (string_content) .) @injection.content(#set! injection.language "sql")
    ])
  ))
