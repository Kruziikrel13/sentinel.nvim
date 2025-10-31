return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts_extend = { "servers.*.keys" },
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
				},
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = Sentinel.config.icons.diagnostics.Error,
						[vim.diagnostic.severity.WARN] = Sentinel.config.icons.diagnostics.Warn,
						[vim.diagnostic.severity.HINT] = Sentinel.config.icons.diagnostics.Hint,
						[vim.diagnostic.severity.INFO] = Sentinel.config.icons.diagnostics.Info,
					},
				},
			},
			inlay_hints = {
				enabled = true,
				exclude = {}, -- file types to exclude inlay hints
			},
			codelens = { -- enable builtin lsp code lenses
				enabled = false,
			},
			folds = {
				enabled = true,
			},
			servers = {
				["*"] = {
					workspace = {
						fileOperations = {
							didRename = true,
							willRename = true,
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							codeLens = {
								enable = true,
							},
							completion = {
								callSnippet = "Replace",
							},
							doc = {
								privateName = { "^_" },
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndec = "Disable",
							},
						},
					},
				},
			},
		},
		config = vim.schedule_wrap(function(_, opts)
			if opts.inlay_hints.enabled then
				Snacks.util.lsp.on({ method = "textDocument/inlayHint" }, function(buf)
					if
						vim.api.nvim_buf_is_valid(buf)
						and vim.bo[buf].buftype
						and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buf].filetype)
					then
						vim.lsp.inlay_hint.enable(true, { bufnr = buf })
					end
				end)
			end

			if opts.folds.enabled then
				Snacks.util.lsp.on({ method = "textDocument/foldingRange" }, function()
					if vim.o.foldmethod == "expr" then
						vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
					end
				end)
			end

			if opts.codelens.enabled and vim.lsp.codelens then
				Snacks.util.lsp.on({ method = "textDocument/codeLens" }, function(buf)
					vim.lsp.codelens.refresh()
					vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
						buffer = buf,
						callback = vim.lsp.codelens.refresh,
					})
				end)
			end

			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			if opts.servers["*"] then
				vim.lsp.config("*", opts.servers["*"])
			end

			local function configure(server)
				if server == "*" then
					return false
				end
				local sopts = opts.servers[server]
				sopts = sopts == true and {} or (not sopts) and { enabled = false } or sopts

				local setup = opts.setup[server] or opts.setup["*"]
				if not setup and setup(server, sopts) then
					vim.lsp.config(server, sopts)
					vim.lsp.enable(server)
				end
			end
		end),
	},
	{
		"kruziikrel13/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", optional = true },
		},
		opts = {
			code_action = {
				keys = {
					quit = { "<Esc>", "q" },
				},
			},
			finder = {
				keys = {
					vsplit = "<C-v>",
					split = "<C-x>",
					toggle_or_open = "<CR>",
				},
			},
			rename = {
				keys = {
					quit = { "<Esc>", "q" },
					select = "e",
				},
			},
			lightbulb = {
				sign = false,
			},
		},
		keys = {
			{ "<Tab><Tab>", "<CMD>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
			{ "<Tab>r", "<CMD>Lspsaga rename<CR>", desc = "Hover Doc" },
			{ "<Tab>d", "<CMD>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
			{ "<Tab>f", "<CMD>Lspsaga finder<CR>", desc = "Find" },
			{ "<Tab>a", "<CMD>Lspsaga code_action<CR>", desc = "Code Actions" },
			{ "<leader>xx", "<CMD>Lspsaga show_workspace_diagnostics ++float<CR>", desc = "Workspace diagnostics" },
			{ "<leader>xj", "<CMD>Lspsaga diagnostic_jump_next<CR>", desc = "Jump to next diagnostic" },
			{ "<leader>xk", "<CMD>Lspsaga diagnostic_jump_prev<CR>", desc = "Jump to prev diagnostic" },
		},
	},
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<Tab>", group = "lsp" },
				{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
			},
		},
	},
}
