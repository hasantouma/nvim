-- set colorscheme to gruvbox with protected call
-- in case it isn't installed
local gruvbox_status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not gruvbox_status then
  print("Colorscheme not found!")
  return
end

