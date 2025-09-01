local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	api.config.mappings.default_on_attach(bufnr)

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set("n", ">", api.tree.change_root_to_node, opts("change root to node"))
	vim.keymap.set("n", "<", api.tree.change_root_to_parent, opts("change root to parent"))
	vim.keymap.set("n", "<BS>", api.tree.toggle_hidden_filter, opts("toggle hidden"))
	vim.keymap.set("n", "g<BS>", api.tree.toggle_gitignore_filter, opts("toggle gitignore"))
	vim.keymap.set("n", "c", api.node.navigate.parent_close, opts("close parent"))
	vim.keymap.set("n", "C", api.tree.collapse_all, opts("close parent"))
end

return {
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			on_attach = my_on_attach,
			hijack_cursor = true,
			disable_netrw = true,
			prefer_startup_root = true,
			sync_root_with_cwd = true,
			modified = {
				enable = true,
			},
			renderer = {
				group_empty = true,
				hidden_display = "simple",
				icons = {
					git_placement = "after",
					glyphs = {
						git = {
							unstaged = Sentinel.config.icons.git.modified,
							staged = Sentinel.config.icons.git.staged,
							untracked = Sentinel.config.icons.git.untracked,
							deleted = Sentinel.config.icons.git.removed,
						},
					},
				},
			},
			diagnostics = {
				enable = true,
			},
			filters = {
				dotfiles = true,
			},
		},
		lazy = false,
		keys = {
			{ "t", "<CMD>NvimTreeToggle<cr>", desc = "Explorer" },
		},
	},
	{
		"antosha417/nvim-lsp-file-operations",
		config = true,
		dependencies = { "nvim-tree/nvim-tree.lua", "nvim-lua/plenary.nvim" },
	},
}
