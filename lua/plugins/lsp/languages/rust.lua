local diagnostics = "rust-analyzer"
return {
	{
		"nvim-treesitter",
		opts = { ensure_installed = { "rust", "ron" } },
	},
	{
		"nvim-lspconfig",
		opts = {
			servers = {
				rust_analyzer = { enabled = false },
			},
		},
	},
	{
		"nvim-dap",
		opts = {
			adapters = {
				lldb = {
					type = "executable",
					command = "lldb-dap",
					name = "lldb",
				},
			},
			configurations = {
				rust = {
					{
						name = "Launch",
						type = "lldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug", "file")
						end,
						cwd = "${workspaceFolder}",
						args = {},
					},
				},
			},
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {},
	},
	{
		"mrcjkb/rustaceanvim",
		ft = "rust",
		opts = {
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<Tab>a", function()
						vim.cmd.RustLsp("codeAction")
					end, { desc = "Code Action", buffer = bufnr })
				end,
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
						},
						-- Add clippy lints for Rust if using rust-analyzer
						checkOnSave = diagnostics == "rust-analyzer",
						-- Enable diagnostics if using rust-analyzer
						diagnostics = {
							enable = diagnostics == "rust-analyzer",
						},
						procMacro = {
							enable = true,
						},
						files = {
							watcher = "client",
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
			if not Sentinel.executable("rust-analyzer") then
				Sentinel.error("**rust-analyzer** not found in PATH")
			end
		end,
	},
}
