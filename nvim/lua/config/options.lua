-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

vim.opt.relativenumber = true
vim.g.autoformat = false
vim.g.have_nerd_font = true

local opt = vim.opt
opt.conceallevel = 0
opt.winborder = "rounded"
opt.foldmethod = "indent"

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  severity_sort = true,
  float = { border = "rounded", source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})
