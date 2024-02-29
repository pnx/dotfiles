; inherits: php_only

; php tags should be tagged as preprocessor tokens
(php_tag) @preproc

; Tag names in class definition as regular text.
(class_declaration [
	name: (name) @text
	(base_clause (name) @text)
	(class_interface_clause (name) @text)
])

; tag "use" traits as text
(use_declaration (name) @text)

; tag namespace classes in "use" as text
(namespace_use_declaration (namespace_use_clause [
	(qualified_name [
		(name) @text
		(namespace_name_as_prefix (namespace_name (name) @text))
	])
	(namespace_aliasing_clause (name) @text)
]))
