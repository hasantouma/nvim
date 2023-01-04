-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  print("lualine not found!")
  return
end

-- get lualine gruvbox theme
-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md#gruvbox
local gruvbox_status, lualine_gruvbox = pcall(require, "lualine.themes.gruvbox")
if not gruvbox_status then
  print("lualine.themes.gruvbox not found!")
  return
end

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_gruvbox,
  },
})

