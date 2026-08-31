return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  keys = {
    { "<leader>tc", ":TestNearest<CR>", silent = true, desc = "Test nearest" },
    { "<leader>tf", ":TestFile<CR>", silent = true, desc = "Test file" },
    { "<leader>tl", ":TestLast<CR>", silent = true, desc = "Test last" },
    { "<leader>tt", ":TestSuite<CR>", silent = true, desc = "Test suite" },
  },
  config = function()
    vim.g["test#strategy"] = "vimux"
    vim.g["test#elixir#exunit#executable"] = "source .env.local && mix test"
    vim.g["test#elixir#exunit#file_pattern"] = "\\v(_test\\.exs)$"
  end,
}

