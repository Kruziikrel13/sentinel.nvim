# Sentinel Neovim Config
> [!WARNING]
> Windows is not currently supported

# Editor Settings
```lua
vim.o.background = "dark" ---@type "light" | "dark"
vim.g.EDITOR_THEME = "github" ---@see lua/plugins/colorschemes
vim.g.TRANSPARENT = false
vim.g.ENABLE_SIDEKICK = true -- requires copilot-language-server
```

# Dependencies
- gcc
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)

## Optional
- [gh](https://cli.github.com/)
- [copilot-language-server](https://github.com/features/copilot)
