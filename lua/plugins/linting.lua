return {
	{
		"mfussenegger/nvim-lint",
		event = "LazyFile",
		opts = {
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
			linters_by_ft = {},
			linters = {},
		},
		config = function(_, opts)
			local Lint = require("lint")

			for name, linter in pairs(opts.linters) do
				if type(linter) == "table" and type(Lint.linters[name]) == "table" then
					Lint.linters[name] = vim.tbl_deep_extend("force", Lint.linters[name], linter)
					if type(linter.prepend_args) == "table" then
						Lint.linters[name].args = Lint.linters[name].args or {}
						vim.list_extend(Lint.linters[name].args, linter.prepend_args)
					end
				else
					Lint.linters[name] = linter
				end
			end
			Lint.linters_by_ft = opts.linters_by_ft

			local function lint()
				-- Use nvim-lint's logic first:
				-- * checks if linters exist for the full filetype first
				-- * otherwise will split filetype by "." and add all those linters
				-- * this differs from conform.nvim which only uses the first filetype that has a formatter
				local names = Lint._resolve_linter_by_ft(vim.bo.filetype)
				-- Create a copy of the names table to avoid modifying the original.
				names = vim.list_extend({}, names)

				-- Add fallback linters.
				if #names == 0 then
					vim.list_extend(names, Lint.linters_by_ft["_"] or {})
				end

				-- Add global linters.
				vim.list_extend(names, Lint.linters_by_ft["*"] or {})

				-- Filter out linters that don't exist or don't match the condition.
				local ctx = { filename = vim.api.nvim_buf_get_name(0) }
				ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
				names = vim.tbl_filter(function(name)
					local linter = Lint.linters[name]
					return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
				end, names)

				-- Run linters.
				if #names > 0 then
					Lint.try_lint(names)
				end
			end

			vim.api.nvim_create_autocmd(opts.events, {
				group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = Sentinel.debounce(100, lint),
			})
		end,
	},
}
