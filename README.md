# Quarto for Zed

Quarto support for the [Zed editor](https://zed.dev).

## Features

- Full syntax highlighting for `.qmd` files
  - Headers, lists, block quotes, thematic breaks
  - Bold, italic, strikethrough, inline code
  - Links and images
  - Tables
  - YAML front matter (with YAML syntax highlighting)
- Code block injections for:
  - R (`{r}`)
  - Python (`{python}`)
  - Julia (`{julia}`)
  - Observable JS (`{ojs}`)
  - Mermaid diagrams (`{mermaid}`)
  - Graphviz/Dot (`{dot}`)
  - LaTeX/TeX (`{latex}`, `{tex}`)
  - Standard markdown code blocks (```python, ```r, etc.)
- Outline view for document navigation (headings)
- Code snippets for common Quarto patterns

## Installation

### From Zed Extensions (coming soon)

Search for "Quarto" in Zed's extension marketplace.

### Manual Installation (Development)

1. Clone this repository:
   ```bash
   git clone https://github.com/prefrontal-systems/zed-quarto-plugin.git
   ```
2. Open Zed
3. Open the Command Palette (`Cmd+Shift+P`)
4. Search for "zed: install dev extension"
5. Select the `zed-quarto-plugin` directory

## Snippets

The extension includes snippets for common Quarto patterns:

- `r` - R code chunk
- `py` - Python code chunk
- `note` - Callout note block
- `yaml` - YAML front matter template

## Render and Preview

To preview your Quarto document:

1. Open the integrated terminal in Zed (`Ctrl+~` or `Cmd+J`)
2. Run:
   ```bash
   quarto preview your-document.qmd
   ```
3. Open the preview URL in your browser

## Project Structure

```
zed-quarto-plugin/
├── extension.toml              # Extension metadata
├── languages/
│   ├── quarto/                 # Main Quarto language
│   │   ├── config.toml         # Language configuration
│   │   ├── highlights.scm      # Syntax highlighting queries
│   │   ├── injections.scm      # Language injection queries
│   │   └── outline.scm         # Outline/symbol queries
│   └── markdown-inline/        # Inline markdown (bold, italic, etc.)
│       ├── config.toml
│       └── highlights.scm
├── grammars/                   # Tree-sitter grammar source
└── snippets/
    └── quarto.json             # Code snippets
```

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

MIT

## Credits

- Uses [tree-sitter-markdown](https://github.com/tree-sitter-grammars/tree-sitter-markdown) grammar
- Built by [Prefrontal Systems](https://prefrontal.systems)
