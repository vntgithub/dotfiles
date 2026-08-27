return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  config = function()
    vim.g["test#strategy"] = "vimux"
    vim.g["test#elixir#exunit#executable"] = "source .env.local && mix test"
    vim.g["test#elixir#exunit#file_pattern"] = "\\v(tests*\\.exs|\\.ex)$"

    vim.keymap.set("n", "<leader>tc", ":TestNearest<CR>", { silent = true, desc = "Test nearest" })
    vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { silent = true, desc = "Test file" })
    vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { silent = true, desc = "Test last" })
    vim.keymap.set("n", "<leader>tt", ":TestSuite<CR>", { silent = true, desc = "Test suite" })
  end,
}
