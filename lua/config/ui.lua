vim.cmd("colorscheme catppuccin")
require("mini.basics").setup()

require("tiny-inline-diagnostic").setup({})
require("neo-tree").setup({})
require("lualine").setup({})
require("bufferline").setup({})
require("ibl").setup()
require("which-key").setup({})
require("telescope").setup({})
require("noice").setup({})
require("hop").setup({})

-- dashboard
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("dashboard").setup({})
  end,
})

-- keys
local core = require("config.core")
vim.keymap.set("n", "-", ":Neotree focus<Cr>", core.opt("open neotree"))
vim.keymap.set("n", "<leader>qq", ":qa!<Cr>", core.opt("exit"))
vim.keymap.set("n", "<leader>qx", ":wqa!<Cr>", core.opt("exit and save"))
vim.keymap.set("n", "<leader><left>", ":bp<Cr>", core.opt("last buffer"))
vim.keymap.set("n", "<leader><right>", ":bn<Cr>", core.opt("next buffer"))
vim.keymap.set("n", "<leader><leader>", ":HopWord<Cr>", core.opt("hop word"))
vim.keymap.set("n", "<leader>/", ":HopPattern<Cr>", core.opt("hop pattern"))
