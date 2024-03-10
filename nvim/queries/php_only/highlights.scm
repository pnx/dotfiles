; inherits: php_only

; php tags should be tagged as preprocessor tokens
(php_tag) @preproc

; Tag names in class definition as regular text.
(class_declaration [
	name: (name) @class_name
	(base_clause (name) @extend_name)
	(class_interface_clause (name) @implement_name)
])

; tag "use" traits as text
(use_declaration (name) @text)

; tag namespace classes in "use" as text
(namespace_use_declaration (namespace_use_clause [
	(qualified_name [
		(name) @namespace_name
		(namespace_name_as_prefix (namespace_name (name) @namespace_name))
	])
	(namespace_aliasing_clause (name) @namespace_alias)
]))
