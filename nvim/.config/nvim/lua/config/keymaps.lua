vim.keymap.set("n", "<leader>pp", ":let @+ = expand('%:.')<CR>", { desc = "Copy relative path" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with j k" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Navigate vim panes better (`<C-l>` still redraws via <C-w>l, not :wincmd)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- BUFFER MANAGEMENT
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>ba", ":%bd<CR>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bb", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

-- Diagnostics (`[e`/`]e` are errors only; `[d`/`]d` are all severities)
local function diagnostic_goto(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "<leader>cl", vim.diagnostic.setqflist, { desc = "LSP Diagnostic List" })
