---@class util.terminal
local M = {}

function M.setup()
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

return M
