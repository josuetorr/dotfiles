local colo = "dracula"

local status_ok, _ = pcall(vim.cmd, "colo " .. colo)
if not status_ok then
  vim.notify("colorscheme " .. colo .. " not found!")
  return
end
