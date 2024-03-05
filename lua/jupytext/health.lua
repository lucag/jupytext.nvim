local M = {}

local is_installed = function(mod)
  vim.cmd "python3 import pkgutil"
  vim.cmd "python3 import importlib"
  return vim.fn.py3eval("importlib.util.find_spec('" .. mod .. "') is not None")
end

M.check = function()
  vim.health.report_start "jupytext.nvim"

  if is_installed "jupytext" then
    vim.health.report_ok "Jupytext is available"
  else
    vim.health.report_error("Jupytext is not available", "Install jupytext via `pip install jupytext`")
  end
end

return M
