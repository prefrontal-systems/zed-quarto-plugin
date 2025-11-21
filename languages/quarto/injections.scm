; Inject inline grammar into inline content (headings, paragraphs, etc.)
((inline) @injection.content
 (#set! injection.language "markdown-inline")
 (#set! injection.include-children))

; Generic code block injection - uses info_string as language name
((fenced_code_block
  (info_string (language) @injection.language)
  (code_fence_content) @injection.content))

; Quarto-specific code blocks with curly braces
((fenced_code_block
  (info_string) @_lang
  (code_fence_content) @injection.content)
 (#match? @_lang "^\\{r\\}")
 (#set! injection.language "r"))

((fenced_code_block
  (info_string) @_lang
  (code_fence_content) @injection.content)
 (#match? @_lang "^\\{python\\}")
 (#set! injection.language "python"))

((fenced_code_block
  (info_string) @_lang
  (code_fence_content) @injection.content)
 (#match? @_lang "^\\{julia\\}")
 (#set! injection.language "julia"))

((fenced_code_block
  (info_string) @_lang
  (code_fence_content) @injection.content)
 (#match? @_lang "^\\{ojs\\}")
 (#set! injection.language "javascript"))

((fenced_code_block
  (info_string) @_lang
  (code_fence_content) @injection.content)
 (#match? @_lang "^\\{dot\\}")
 (#set! injection.language "dot"))

((fenced_code_block
  (info_string) @_lang
  (code_fence_content) @injection.content)
 (#match? @_lang "^\\{mermaid\\}")
 (#set! injection.language "mermaid"))

((fenced_code_block
  (info_string) @_lang
  (code_fence_content) @injection.content)
 (#match? @_lang "^\\{(latex|tex)\\}")
 (#set! injection.language "latex"))

; YAML front matter
((minus_metadata) @injection.content
 (#set! injection.language "yaml"))

; HTML blocks
((html_block) @injection.content
 (#set! injection.language "html"))
