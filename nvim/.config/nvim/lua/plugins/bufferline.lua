return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin" },
  keys = {
    { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
  },
  opts = function()
    return {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
      highlights = require("catppuccin.special.bufferline").get_theme(),
    }
  end,
}
