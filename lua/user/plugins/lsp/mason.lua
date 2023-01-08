-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("mason not found!")
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  print("mason-lspconfig not found!")
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  print("mason-null-ls not found!")
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
  ensure_installed = {
    "sumneko_lua", -- Lua
    "ocamllsp", -- OCaml
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
  ensure_installed = {
    "ocamlformat", -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#ocamlformat
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})

