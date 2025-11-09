return {
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<BS>", desc = "Decrement Selection", mode = "x" },
				{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = function()
			local TS = require("nvim-treesitter")

			if not TS.get_installed then
				vim.notify("Please restart neovim and run `:TSUpdate` to use nvim treesitter")
			end
			package.loaded["sentinel.util.treesitter"] = nil -- ensure we use latest treesitter util

			Sentinel.treesitter.build(function()
				TS.update(nil, { summary = true })
			end)
		end,
		event = { "VeryLazy", "BufReadPost", "BufNewFile", "BufWritePre" },
		cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
		opts_extend = { "ensure_installed" },
		opts = {
			indent = { enable = true },
			highlight = { enable = true },
			folds = { enable = true },
		},
		config = function(_, opts)
			local TS = require("nvim-treesitter")

			if not TS.get_installed then
				vim.notify("Please use `:Lazy` and update `nvim-treesitter`")
			elseif opts.ensure_installed ~= nil and type(opts.ensure_installed) ~= "table" then
				vim.notify("`nvim-treesitter` opts.ensure_installed must be a table")
			end

			TS.setup(opts)
			Sentinel.treesitter.get_installed(true) -- initialize installed langs

			-- install missing parsers
			local install = vim.tbl_filter(function(lang)
				return not Sentinel.treesitter.have(lang)
			end, opts.ensure_installed or {})
			if #install > 0 then
				Sentinel.treesitter.build(function()
					TS.install(install, { summary = true }):await(function()
						Sentinel.treesitter.get_installed(true) -- refresh the installed langs
					end)
				end)
			end

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
					if not Sentinel.treesitter.have(ft) then
						return
					end

					---@param feat string
					---@param query string
					local function enabled(feat, query)
						local f = opts[feat] or {}
						return f.enable ~= false
							and not (type(f.disable) == "table" and vim.tbl_contains(f.disable, lang))
							and Sentinel.treesitter.have(ft, query)
					end

					local function set_default(option, value)
						vim.api.nvim_set_option_value(option, value, { scope = "local" })
					end

					-- highlighting
					if enabled("highlight", "highlights") then
						pcall(vim.treesitter.start, ev.buf)
					end

					-- indents
					if enabled("indent", "indents") then
						set_default("indentexpr", "v:lua.Sentinel.treesitter.indentexpr()")
					end

					-- folds
					if enabled("folds", "folds") then
						set_default("foldmethod", "expr")
						set_default("foldexpr", "v:lua.Sentinel.treesitter.foldexpr()")
					end
				end,
			})
		end,
	},

	-- Automatically add closing tags for HTML and JSX
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {},
	},
}
