return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end
      },

      -- Keymaps for bufferline
      vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>bd', ':BufferLinePickClose<CR>', { noremap = true, silent = true }),

    })
  end,
}
