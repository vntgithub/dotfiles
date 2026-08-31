-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>pp", ":let @+ = expand('%:.')<CR>", { desc = "Copy relative path" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with j k" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>ba", ":%bd<CR>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bb", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

vim.keymap.set("n", "<C-p>", function()
  Snacks.picker.files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Live grep" })
