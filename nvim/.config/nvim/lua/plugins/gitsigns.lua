return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    signs_staged = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    on_attach = function(buffer)
      local gs = require("gitsigns")

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc, silent = true })
      end

      map("n", "]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next hunk")
      map("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Prev hunk")

      map({ "n", "x" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
      map({ "n", "x" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gl", gs.preview_hunk_inline, "Preview hunk inline")
      map("n", "<leader>gd", gs.diffthis, "Diff this")
      map("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<leader>gq", function()
        gs.setqflist()
      end, "Git hunks to quickfix")
      map("n", "<leader>gQ", function()
        gs.setloclist()
      end, "Git hunks to location list")
      map("n", "<leader>gh", gs.toggle_current_line_blame, "Toggle current line blame")
      map("n", "<leader>gH", gs.toggle_linehl, "Toggle line highlight")
      map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
    end,
  },
}
