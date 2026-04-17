; inherits: vue

(
  (element
    (start_tag
      (tag_name) @_tag
      (attribute
        (attribute_name) @_attr
        (quoted_attribute_value
          (attribute_value) @injection.language)))
    (text) @injection.content)
  (#match? @_tag "^(i18n)$")
  (#eq? @_attr "lang")
  (#match? @injection.language "^(yaml|json)$")
)
