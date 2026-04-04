-- return {
--   'akinsho/bufferline.nvim',
--   version = "*",
--   dependencies = 'nvim-tree/nvim-web-devicons',
--   config = function()
--     require("bufferline").setup({
--       options = {
--         diagnostics = "nvim_lsp",
--         diagnostics_indicator = function(count, level, diagnostics_dict, context)
--           local icon = level:match("error") and " " or " "
--           return " " .. icon .. count
--         end
--       },
--
--       -- Keymaps for bufferline
--       vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { noremap = true, silent = true }),
--       vim.keymap.set('n', '<leader>bd', ':BufferLinePickClose<CR>', { noremap = true, silent = true }),
--
--     })
--   end,
-- }
return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        style_preset = require("bufferline").style_preset.default,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        -- Adds space for your file explorer (matches Cursor sidebar)
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
        color_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
      -- Highlights based on your Cursor JSON theme
      highlights = {
        fill = {
          bg = "#191c22", -- tab.inactiveBackground / editorGroupHeader.tabsBackground
        },
        background = {
          fg = "#4b5163", -- tab.inactiveForeground
          bg = "#191c22",
        },
        buffer_selected = {
          fg = "#d8dee9", -- tab.activeForeground
          bg = "#1e2127", -- tab.activeBackground (Matches Editor)
          bold = true,
          italic = false,
        },
        separator = {
          fg = "#191c22",
          bg = "#191c22",
        },
        separator_selected = {
          fg = "#191c22",
          bg = "#1e2127",
        },
        indicator_selected = {
          fg = "#88c0d0", -- Cursor Cyan accent
          bg = "#1e2127",
        },
        diagnostic_selected = {
          bg = "#1e2127",
        },
        hint_selected = { bg = "#1e2127" },
        info_selected = { bg = "#1e2127" },
        warning_selected = { bg = "#1e2127" },
        error_selected = { bg = "#1e2127" },
        modified_selected = {
          fg = "#ebcb8b",
          bg = "#1e2127",
        },
      },
    })

    -- Keymaps (Moved outside setup)
    vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>bd', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
    -- Added Tab switching to match modern workflow
    vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
  end,
}
