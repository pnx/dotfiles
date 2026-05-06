; extends

; NOTE: Some LSPs sets semantic tokens, so override those with high priority (150)

; php tags should be tagged as preprocessor tokens
(php_tag) @preproc

; Tag names in class definition
(class_declaration
  (name) @class.declaration.name.php
  (#set! priority 150))

(class_declaration
  (base_clause (name) @class.declaration.inherit.name.php)
  (#set! priority 150))

(class_declaration
  (class_interface_clause (name) @class.declaration.implement.name.php)
  (#set! priority 150))

(interface_declaration (name)
  @interface.declaration.name
  (#set! priority 150))

; semantic tokens sometimes targets the entire namespace. So tag it here to override.
(qualified_name [ (namespace_name) "\\"] @class.use.base.php (#set! priority 150))

; last name node in namespace definition
(namespace_definition
  name: (namespace_name
    (name) @namespace.name (#set! priority 150) .)
)

; tag trait name in use declaration
(use_declaration (name) @use.trait.name)

; tag name token in "use" use namespace declaration
(namespace_use_declaration (namespace_use_clause [
	(qualified_name [
    (name) @namespace.name (#set! priority 150)
	])
  alias: (name) @namespace.alias.name (#set! priority 150)
]))




