; Emphasis
(emphasis) @emphasis
(strong_emphasis) @emphasis.strong
(strikethrough) @punctuation.special

; Code
(code_span) @string

; Links
(link_text) @link_text
(link_destination) @link_uri
(link_title) @string
(link_label) @link_text

[
  (uri_autolink)
  (email_autolink)
] @link_uri

[
  (inline_link)
  (full_reference_link)
  (collapsed_reference_link)
  (shortcut_link)
  (image)
] @link_text

; Escapes and special characters
(backslash_escape) @string.escape
(entity_reference) @string.special
(numeric_character_reference) @string.special

; HTML
(html_tag) @tag

; LaTeX
(latex_block) @string
