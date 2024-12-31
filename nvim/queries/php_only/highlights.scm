; inherits: php_only

; php tags should be tagged as preprocessor tokens
(php_tag) @preproc

; Tag names in class definition
(class_declaration [
	name: (name) @class.name
	(base_clause (name) @class.inherit.name)
	(class_interface_clause (name) @class.implements.name)
])

(interface_declaration (name) @interface.name)

; tag trait name in use declaration
(use_declaration (name) @use.trait.name)

; tag name token in "use" use namespace declaration
(namespace_use_declaration (namespace_use_clause [
	(qualified_name [
		(name) @namespace.name
	])
    alias: (name) @namespace.alias.name
]))
