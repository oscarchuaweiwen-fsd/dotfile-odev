-- common
require("odev.core.keymap")
require("odev.core.opt")
require("odev.core.colorscheme")
-- plugins
require("odev.plugins.nvim-tree")
require("odev.plugins.nvim-treesitter")
require("odev.plugins.nvim-telescope")
require("odev.plugins.nvim-lualine")
require("odev.plugins.nvim-code-runner")
require("odev.plugins.nvim-cmp")
require("odev.plugins.comment")
require("odev.plugins.colorizer")
require("odev.plugins.mason")
-- lsp config
require("odev.plugins.lsp.lspconfig")
require("odev.plugins.lsp.lspkind")
require("odev.plugins.lsp.lspsaga")
require("odev.plugins.lsp.null-ls")
-- dap config
require("odev.plugins.dap.dap")
require("odev.plugins.dap.dapui")

print("welcome back, odev")
