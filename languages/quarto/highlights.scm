; Headings
(atx_heading (inline) @title)
(setext_heading (paragraph) @title)

[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
  (setext_h1_underline)
  (setext_h2_underline)
] @punctuation.special

; Code blocks
(fenced_code_block_delimiter) @punctuation.delimiter
(info_string (language) @label)

; Links
(link_destination) @link_uri
(link_label) @link_text
(link_title) @string

; Lists
[
  (list_marker_plus)
  (list_marker_minus)
  (list_marker_star)
  (list_marker_dot)
  (list_marker_parenthesis)
] @punctuation.list_marker

; Task lists
(task_list_marker_checked) @punctuation.special
(task_list_marker_unchecked) @punctuation.special

; Block quotes
(block_quote_marker) @punctuation.special

; Thematic breaks
(thematic_break) @punctuation.special

; Tables
(pipe_table_header) @title
(pipe_table_delimiter_row) @punctuation.special

; Escapes
(backslash_escape) @string.escape
(entity_reference) @string.special
(numeric_character_reference) @string.special
