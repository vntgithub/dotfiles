
-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

local map = vim.keymap.set

-- Show the full error message in a floating window (Peeking)
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Jump to next/previous error
map("n", "]e", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "[e", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- Show all diagnostics in a list (Quickfix)
map("n", "<leader>cl", vim.diagnostic.setqflist, { desc = "LSP Diagnostic List" })
