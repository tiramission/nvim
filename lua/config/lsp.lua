-- lsp
require("lazydev").setup({})
require("mason").setup({})
require("mason-lspconfig").setup({ automatic_enable = false })
require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  fuzzy = { implementation = "lua" },
})

vim.lsp.config("stylua", {
  cmd = {
    "stylua",
    "--config-path",
    vim.fn.expand("~/.config/nvim/.stylua.toml"),
    "--lsp",
  },
})
vim.lsp.config("lua_ls", {
  settings = {
    Lua = { format = { enable = false } },
  },
})

require("mason-auto-install").setup({
  packages = { "lua-language-server", "stylua", "gopls" },
})
vim.lsp.enable({ "lua_ls", "stylua", "gopls" })

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- keys
local core = require("config.core")
vim.keymap.set("n", "<leader>ca", require("actions-preview").code_actions, core.opt("code action"))
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, core.opt("format buffer"))
