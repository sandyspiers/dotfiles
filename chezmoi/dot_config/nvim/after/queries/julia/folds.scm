;; extends

; fold docstrings that immediately precede a definition
((string_literal) @fold
  .
  [
    (abstract_definition)
    (assignment)
    (const_statement)
    (function_definition)
    (macro_definition)
    (macrocall_expression)
    (module_definition)
    (struct_definition)
  ])

; fold top-level module docstrings
(source_file
  (string_literal) @fold
  .
  [
    (identifier)
    (call_expression)
  ])
