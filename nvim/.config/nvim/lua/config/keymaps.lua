--Reload config
vim.keymap.set("n", "<leader>rr", ":source $MYVIMRC<CR>", { desc = "Reload config" })
vim.keymap.set("n", "<leader>pp", ":let @+ = expand('%:.')<CR>", { desc = "Copy relative path" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with j k" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.wo.number = true

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- BUFFER MANAGEMENT
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>ba", ":%bd<CR>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bb", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

-- LSP Diagnostics keymaps
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set("n", "<leader>cl", vim.diagnostic.setqflist, { desc = "LSP Diagnostic List" })
vim.keymap.set("n", "<leader>cc", ":Telescope diagnostics<CR>", { desc = "LSP Diagnostic List (Telescope)" })

-- Gitsigns
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gl", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk inline" })
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Diff this" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Blame line" })
vim.keymap.set("n", "<leader>gq", ":Gitsigns setqflist<CR>", { desc = "Git hunks to quickfix" })
vim.keymap.set("n", "<leader>gQ", ":Gitsigns setloclist<CR>", { desc = "Git hunks to location list" })
vim.keymap.set("n", "<leader>gh", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })
vim.keymap.set("n", "<leader>gH", ":Gitsigns toggle_linehl<CR>", { desc = "Toggle line highlight" })
vim.keymap.set("n", "<leader>gS", ":Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })
