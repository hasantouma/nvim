-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local packer_status, packer = pcall(require, "packer")
if not packer_status then
  print("packer not found!")
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  -- https://github.com/wbthomason/packer.nvim
  use("wbthomason/packer.nvim")

  -- lua functions that many plugins use
  -- https://github.com/nvim-lua/plenary.nvim
  use("nvim-lua/plenary.nvim")

  -- gruvbox colorscheme
  -- https://github.com/ellisonleao/gruvbox.nvim
  use ("ellisonleao/gruvbox.nvim")

  -- commenting with gc
  -- https://github.com/numToStr/Comment.nvim
  use("numToStr/Comment.nvim")

  -- file explorer
  -- https://github.com/nvim-tree/nvim-tree.lua
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  -- https://github.com/nvim-tree/nvim-web-devicons
  use("nvim-tree/nvim-web-devicons")

  -- statusline
  -- https://github.com/nvim-lualine/lualine.nvim
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- autocompletion
  -- https://github.com/hrsh7th/nvim-cmp
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  -- https://github.com/williamboman/mason.nvim
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  -- https://github.com/neovim/nvim-lspconfig
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  if packer_bootstrap then
    require("packer").sync()
  end
end)

