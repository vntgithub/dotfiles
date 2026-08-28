return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<C-p>", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
    { "<leader><leader>", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
    { "<leader>fw", function() require("telescope.builtin").grep_string() end, desc = "Grep word" },
    { "<leader>fR", function() require("telescope.builtin").resume() end, desc = "Resume last picker" },
    { "<leader>gf", function() require("telescope.builtin").git_files() end, desc = "Git files" },
    { "gR", function() require("telescope.builtin").lsp_references() end, desc = "LSP references" },
    { "<leader>cc", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        winblend = 0,
      },
    })
    pcall(telescope.load_extension, "fzf")
  end,
}
