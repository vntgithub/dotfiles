return {
  'vim-test/vim-test',
  opts = {
    starategy = 'vimux',
  },
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    -- Executables: run source .env.local before running elixir tests
    vim.g['test#elixir#exunit#executable'] = 'source .env.local && mix test'
    -- support run all tests in file not is test file
    vim.g['test#elixir#exunit#file_pattern'] = '\\v(tests*\\.exs|\\.ex)$'
    --Key mappings
    -- Run nearest test
    vim.api.nvim_set_keymap('n', '<leader>tc', ':TestNearest<CR>', { noremap = true, silent = true })
    -- Run the current file's tests
    vim.api.nvim_set_keymap('n', '<leader>tf', ':TestFile<CR>', { noremap = true, silent = true })
    -- Run the last test
    vim.api.nvim_set_keymap('n', '<leader>tl', ':TestLast<CR>', { noremap = true, silent = true })
    -- Run the test suite
    vim.api.nvim_set_keymap('n', '<leader>tt', ':TestSuite<CR>', { noremap = true, silent = true })
  end,
}
