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

## Tasks

The extension bundles tasks for rendering and previewing in
[`languages/quarto/tasks.json`](languages/quarto/tasks.json). With a `.qmd` file active, run
`task: spawn` (`Cmd+Shift+R`) and type `Quarto`. The `quarto` CLI must be on your `PATH`.

| Task | Command |
| --- | --- |
| Preview document | `quarto preview <file>`, also as `--to html` and `--to pdf` |
| Render document | `quarto render <file>` |
| Render document (format) | `--to` `all`, `html`, `pdf`, `docx`, `typst` or `revealjs` |
| Render document (refresh cache) | `quarto render <file> --cache-refresh` |
| Render document (skip code execution) | `quarto render <file> --no-execute` |
| Render project | `quarto render` |
| Preview project | `quarto preview`, also with `--render all` |
| Convert document to .ipynb | `quarto convert <file> --output <stem>.ipynb` |
| Check installation | `quarto check` |

Behaviour to know about:

- Bundled tasks are listed only while a Quarto buffer is active, so they don't appear in
  `_quarto.yml` or `.ipynb` files.
- Project tasks search upward from the active file and run in the nearest folder with a
  `_quarto.yml` or `_quarto.yaml`, so projects in subfolders work. They stop with a message if
  there is none.
- Preview project needs a project type that supports it, such as a website or book. A `default`
  project also needs an index file, otherwise Quarto stops with an error.
- Spawning a running task again restarts it. All document previews share one task per format, so
  previewing another file replaces the running preview.
- The convert task refuses to overwrite an existing `.ipynb`, because `quarto convert` otherwise
  replaces it silently.
- Project and convert tasks use POSIX shell syntax, so they need a shell such as zsh or bash.

### Using the tasks without the extension

Copy the entries you want from `languages/quarto/tasks.json` into one of these files:

- `.zed/tasks.json` for one project (`zed: open project tasks`)
- `~/.config/zed/tasks.json` for all projects (`zed: open tasks`)

Tasks in these files are not limited to Quarto buffers, so they are listed for every file type.
If the extension is also installed, you will see duplicates.

### Keybindings

[`examples/keymap.json`](examples/keymap.json) binds preview to `Cmd+Shift+K` and render to
`Cmd+Alt+K` in `.qmd` files. Copy it into your keymap (`zed: open keymap`). `Cmd+Shift+K` matches
RStudio and the Quarto VS Code extension, but replaces Zed's default `editor::DeleteLine` in
`.qmd` files.

## Project Structure

```
zed-quarto-plugin/
├── extension.toml              # Extension metadata
├── languages/
│   ├── quarto/                 # Main Quarto language
│   │   ├── config.toml         # Language configuration
│   │   ├── highlights.scm      # Syntax highlighting queries
│   │   ├── injections.scm      # Language injection queries
│   │   ├── outline.scm         # Outline/symbol queries
│   │   └── tasks.json          # Render and preview tasks
│   └── markdown-inline/        # Inline markdown (bold, italic, etc.)
│       ├── config.toml
│       └── highlights.scm
├── examples/
│   └── keymap.json             # Optional keybindings for the tasks
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
