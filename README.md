# Editor Settings
```lua
vim.o.background = "dark" ---@type "light" | "dark"
vim.g.EDITOR_THEME = "github" ---@see lua/plugins/colorschemes
vim.g.ENABLE_SIDEKICK = true -- requires copilot-language-server
```


- **Editor Mode**: `vim.o.background` "light | dark"
- **Editor Colorscheme**: `vim.g.EDITOR_THEME`
  - Valid themes can be found in `lua/plugins/colorschemes`

# Dependencies
- Ripgrep
- Lazygit
- gh
- copilot-language-server
