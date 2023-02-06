-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  print("nvim-treesitter.configs not found!")
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  ensure_installed = {
    "diff", -- https://github.com/the-mikedavis/tree-sitter-diff
    "fish", -- https://github.com/ram02z/tree-sitter-fish
    "gitcommit", -- https://github.com/gbprod/tree-sitter-gitcommit
    "lua", -- https://github.com/MunifTanjim/tree-sitter-lua
    "make", -- https://github.com/alemuller/tree-sitter-make
    "ocaml", -- https://github.com/tree-sitter/tree-sitter-ocaml
    "ocaml_interface", -- https://github.com/tree-sitter/tree-sitter-ocaml
    "ocamllex", -- https://github.com/atom-ocaml/tree-sitter-ocamllex
    "python", -- https://github.com/tree-sitter/tree-sitter-python
    "racket", -- https://github.com/6cdh/tree-sitter-racket
    "regex", -- https://github.com/tree-sitter/tree-sitter-regex
  },
  -- auto install above language parsers
  auto_install = true,
})
