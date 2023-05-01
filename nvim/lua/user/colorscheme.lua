local colo = "catppuccin"

vim.g.nord_contrast = true
vim.g.material_style = "deep ocean"
vim.opt.background = "dark"

local status_ok, _ = pcall(vim.cmd, "colo " .. colo)
if not status_ok then
  vim.notify("colorscheme " .. colo .. " not found!")
  return
end
