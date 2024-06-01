local options = {
    backup = false,
    writebackup = false,
    -- clipboard = "unnamedplus" -- Slows down startup time and requires a program to actually use.
    cmdheight = 0,
    fileencoding = "utf-8",
    mouse = "",
    pumheight = 10,
    showmode = false,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    timeout = true,
    timeoutlen = 300,
    undofile = true,
    updatetime = 300,
    expandtab = true,
    shiftwidth = 2,
    smarttab = true,
    softtabstop = 2,
    tabstop = 8,
    cursorline = false,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = true,
    linebreak = true,
    scrolloff = 8,
    sidescrolloff = 8,
    whichwrap = "bs<>[]hl",
    hlsearch = false,
    ignorecase = true,
    exrc = true, -- Local Init File Loading (.nvim.lua)
    termguicolors = true,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
