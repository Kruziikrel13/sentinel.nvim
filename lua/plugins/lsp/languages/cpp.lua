if not Sentinel.executable("clangd") then
	return {}
end

return {
	{
		"nvim-lint",
		opts = {
			linters = {
				cppcheck = {},
				clangtidy = {
					condition = function(ctx)
						return Sentinel.find_file(".clang-tidy", ctx.filename)
					end,
				},
			},
		},
	},
	{
		"nvim-lspconfig",
		opts = {
			servers = {
				clangd = {
					root_markers = {
						"compile_commands.json",
						"compile_flags.txt",
						"configure.ac", -- AutoTools
						"Makefile",
						"configure.ac",
						"configure.in",
						"config.h.in",
						"meson.build",
						"meson_options.txt",
						"build.ninja",
						".git",
					},
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"--fallback-style=llvm",
					},
					init_options = {
						usePlaceholders = true,
						completeUnimported = true,
						clangdFileStatus = true,
					},
				},
			},
		},
	},
	{
		"nvim-treesitter",
		opts = { ensure_installed = { "cpp" } },
	},

	{
		"p00f/clangd_extensions.nvim",
		opts = {},
	},
}
