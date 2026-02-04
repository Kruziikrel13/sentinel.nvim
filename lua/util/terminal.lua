---@diagnostic disable: unused-function, unused-local
---@class sentinel.util.terminal
local M = {}

function M.setup(opts)
	local shell = Sentinel.config.shell
	vim.o.shell = shell or vim.o.shell

	if Sentinel.is_win() then
		if vim.fn.executable("pwsh") == 1 then
			vim.o.shell = "pwsh"
		elseif vim.fn.executable("powershell") == 1 then
			vim.o.shell = "powershell"
		else
			return Sentinel.error("No powershell executable found")
		end

		-- Setting shell command flags
		vim.o.shellcmdflag =
			"-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering='plaintext';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"

		-- Setting shell redirection
		vim.o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'

		-- Setting shell pipe
		vim.o.shellpipe = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'

		-- Setting shell quote options
		vim.o.shellquote = ""
		vim.o.shellxquote = ""
	end
end

---@see https://github.com/folke/snacks.nvim/blob/main/lua/snacks/lazygit.lua
local function l_theme()
	local path = Sentinel.fs.stdpath("cache", "lazygit-theme.yaml")
	local cfg = {
		[241] = { fg = "Special" },
		activeBorderColor = { fg = "MatchParen", bold = true },
		cherryPickedCommitBgColor = { fg = "Identifier" },
		cherryPickedCommitFgColor = { fg = "Function" },
		defaultFgColor = { fg = "Normal" },
		inactiveBorderColor = { fg = "FloatBorder" },
		optionsTextColor = { fg = "Function" },
		searchingActiveBorderColor = { fg = "MatchParen", bold = true },
		selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
		unstagedChangesColor = { fg = "DiagnosticError" },
	}

	if not Sentinel.fs.file_exists(path) then
		local function get_color(v)
			---@type string[]
			local color = {}
			for _, c in ipairs({ "fg", "bg" }) do
				if v[c] then
					local name = v[c]
					local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
					local hl_color ---@type number?
					if c == "fg" then
						hl_color = hl and hl.fg or hl.foreground
					else
						hl_color = hl and hl.bg or hl.background
					end
					if hl_color then
						table.insert(color, string.format("#%06x", hl_color))
					end
				end
			end
			if v.bold then
				table.insert(color, "bold")
			end
			return color
		end

		---@type table<string, string[]>
		local theme = {}

		for k, v in pairs(cfg) do
			if type(k) == "number" then
				local color = get_color(v)
				-- LazyGit uses color 241 a lot, so also set it to a nice color
				-- pcall, since some terminals don't like this
				pcall(io.write, ("\27]4;%d;%s\7"):format(k, color[1]))
			else
				theme[k] = get_color(v)
			end
		end
		cfg = {
			gui = { theme = theme },
		}
		vim.fn.writefile(Sentinel.fs.to_yaml(cfg), path)
	end

	return path
end

local function l_integrate()
	local path = Sentinel.fs.stdpath("cache", "lazygit-integration.yaml")
	local cfg = {
		os = { editPreset = "nvim-remote" },
		gui = { nerdFontsVersion = "3" },
	}

	if not Sentinel.fs.file_exists(path) then
		vim.fn.writefile(Sentinel.fs.to_yaml(cfg), path)
	end

	return path
end

function M.lazygit_setup()
	local cfg_integration = l_integrate()
	local cfg_theme = l_theme()

	local out = vim.fn.system({ "lazygit", "-cd" })
	local lines = vim.split(out, "\n", { plain = true })
	local config_files = vim.tbl_filter(function(v)
		return v:match("%S")
	end, vim.split(vim.env.LG_CONFIG_FILE or "", ",", { plain = true }))

	if vim.v.shell_error == 0 and #lines > 1 then
		local config_dir = vim.split(lines[1], "\n", { plain = true })[1]

		if #config_files == 0 then
			local default = vim.fs.normalize(config_dir .. "/config.yml")
			if Sentinel.fs.file_exists(default) then
				config_files[1] = default
			end
		end
	end

	if not vim.tbl_contains(config_files, cfg_integration) then
		table.insert(config_files, cfg_integration)
	end

	if not vim.tbl_contains(config_files, cfg_theme) then
		table.insert(config_files, cfg_theme)
	end

	vim.env.LG_CONFIG_FILE = table.concat(config_files, ",")
end

-- Requires ergoterm
function M.create_task(cmd, mapping, opts)
	local ergoterm = require("ergoterm")

	if not mapping then
		vim.notify("No task keybind specified.", vim.log.levels.ERROR)
		return
	end

	if not cmd then
		vim.notify("No command specified specified. For terminal " .. opts.name, vim.log.levels.ERROR)
		return
	end

	local task_opts = {
		layout = "right",
		size = {
			right = "20%",
			below = "30%",
		},
		cmd = cmd,
		persist_size = false,
		start_in_insert = false,
		auto_scroll = true,
		bang_target = false,
		cleanup_on_success = not opts.show,
		on_open = function(term)
			local bufnr = term:get_state("bufnr")
			vim.keymap.set("n", "q", function()
				term:close()
			end, { buffer = bufnr, noremap = true, desc = "Close Terminal Window" })

			vim.keymap.set("n", "Q", function()
				-- Cleanup makes the terminal "fail", this fixes a bug to ensure it closes without error
				term:update({ show_on_failure = false })
				term:cleanup()
				vim.notify("Killed terminal")
			end, { buffer = bufnr, noremap = true, desc = "Kill Terminal Process" })

			if opts.open_hook then
				opts.open_hook()
			end
		end,
	}

	task_opts = vim.tbl_deep_extend("force", task_opts, opts or {})
	local terminal = ergoterm:new(task_opts)

	vim.keymap.set("n", "<leader>t" .. mapping, function()
		if terminal:is_active() or opts.show then
			terminal:focus()
		else
			terminal:start()
			vim.notify("Started terminal" .. ((": " .. opts.name) or ""))
		end
	end, { desc = opts.name })
end

return M
