--Reload config
vim.keymap.set("n", "<leader>rr", ":%so<CR>", { desc = "Reload config" })
-- Copy relative path to clipboard using <leader>fr
vim.keymap.set("n", "<leader>pp", ":let @+ = expand('%:.')<CR>", { desc = "Copy relative path" })
-- Exit insert mode with jk
vim.keymap.set("i", "jk", "<ESC>")
-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Buffer management
-- Close current buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close current buffer" })
-- Close all buffers
vim.keymap.set("n", "<leader>ba", ":%bd<CR>", { desc = "Close all buffers" })
-- Close all buffers except current
vim.keymap.set("n", "<leader>bb", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

-- Clear search highlights
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
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

-- GitSigns
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Blame line" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Diff this" })
vim.keymap.set("n", "<leader>gl", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk inline" })
