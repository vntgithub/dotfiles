-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Navigate to tmux panes silently
vim.keymap.set('n', '<c-k>', function() vim.fn.system('tmux select-pane -U') end, { silent = true })
vim.keymap.set('n', '<c-j>', function() vim.fn.system('tmux select-pane -D') end, { silent = true })
vim.keymap.set('n', '<c-h>', function() vim.fn.system('tmux select-pane -L') end, { silent = true })
vim.keymap.set('n', '<c-l>', function() vim.fn.system('tmux select-pane -R') end, { silent = true })

-- Clear search highlights
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

local map = vim.keymap.set

-- Show the full error message in a floating window (Peeking)
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Jump to next/previous error
map("n", "]e", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "[e", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- Shok all diagnostics in a list (Quickfix)
map("n", "<leader>cl", vim.diagnostic.setqflist, { desc = "LSP Diagnostic List" })

-- Reload configuration without restarting nvim
map("n", "<leader>R", ":source $MYVIMRC<CR>", { desc = "Reload Neovim Config" })
