# NeoVim config

## Tutorial

YouTube: https://www.youtube.com/watch?v=vdn_pKJUda8

Repo: https://github.com/josean-dev/dev-environment-files


## Add LSP

Add server to `mason_lspconfig.setup()` in `lua/user/plugins/lsp/mason.lua`

List of available LSP server:
`https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers`


## Add formatters & linters

Add config to `mason_null_ls.setup()` in `lua/user/plugins/lsp/mason.lua`

List of available formatters & linters:
`https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md`


## Add syntax highlighting

Add language parser to `treesitter.setup()` in `lua/user/plugins/treesitter.lua`

List of available syntax highlighting:
`https://github.com/nvim-treesitter/nvim-treesitter#supported-languages`


## Troubleshooting

Run `:checkhealth`

### Treesitter commands
Open `./lua/user/plugins/treesitter.lua`
The parser for each language should install

Languages will be installed in
`~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/parser/`
as `*.so` files

Look at `https://github.com/nvim-treesitter/nvim-treesitter#language-parsers`

Run `:TSUpdate`
Run `:TSInstall <language_to_install>`

