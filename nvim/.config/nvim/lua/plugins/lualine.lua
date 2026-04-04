-- return {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   opts = {
--     options = {
--       theme = "auto",
--     },
--     sections = {
--       lualine_a = { "mode" },
--       lualine_b = { "branch" },
--       lualine_c = { "filename" },
--       lualine_x = { "encoding", "filetype" },
--       lualine_y = { "progress" },
--       lualine_z = { "location" },
--     },
--   },
--
--   config = function(_, opts)
--     local lualine = require("lualine")
--
--     lualine.setup(opts)
--
--     -- Insert Copilot status component into lualine_x
--     table.insert(opts.sections.lualine_x, 2, {
--       function()
--         local ok, copilot = pcall(require, "copilot")
--         if not ok then
--           return ""
--         end
--
--         local clients = vim.lsp.get_clients({ name = "copilot", bufnr = 0 })
--         if #clients == 0 then
--           return ""
--         end
--
--         local status = require("copilot.status").data.status
--
--         if status == "InProgress" then
--           return " Copilot"
--         elseif status == "Warning" then
--           return " Copilot"
--         else
--           return " Copilot"
--         end
--       end,
--       color = { fg = "#A6E3A1" },
--     })
--   end
-- }
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      -- Custom theme to match your Cursor JSON colors
      theme = {
        normal = {
          a = { fg = "#191c22", bg = "#88c0d0", gui = "bold" }, -- Mode (Cyan)
          b = { fg = "#d8dee9", bg = "#434c5e" },             -- Branch (Grey)
          c = { fg = "#7b88a1", bg = "#191c22" },             -- Filename (Dark BG)
        },
        insert = { a = { fg = "#191c22", bg = "#a3be8c", gui = "bold" } }, -- Green
        visual = { a = { fg = "#191c22", bg = "#b48ead", gui = "bold" } }, -- Magenta
        replace = { a = { fg = "#191c22", bg = "#bf616a", gui = "bold" } }, -- Red
        command = { a = { fg = "#191c22", bg = "#ebcb8b", gui = "bold" } }, -- Yellow
        inactive = {
          a = { fg = "#4c566a", bg = "#191c22" },
          b = { fg = "#4c566a", bg = "#191c22" },
          c = { fg = "#4c566a", bg = "#191c22" },
        },
      },
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      globalstatus = true, -- Matches your 'opt.laststatus = 3'
    },
    sections = {
      lualine_a = { { "mode", separator = { left = '' }, right_padding = 2 } },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { { "location", separator = { right = '' }, left_padding = 2 } },
    },
  },

  config = function(_, opts)
    local lualine = require("lualine")

    -- Define Copilot component
    local copilot_component = {
      function()
        local ok, _ = pcall(require, "copilot")
        if not ok then return "" end

        local clients = vim.lsp.get_clients({ name = "copilot", bufnr = 0 })
        if #clients == 0 then return "" end

        local status = require("copilot.status").data.status
        if status == "InProgress" then
          return " Copilot"
        elseif status == "Warning" then
          return " Copilot"
        else
          return " Copilot"
        end
      end,
      -- Changed from Catppuccin Green to your Aurora Green (#a3be8c)
      color = { fg = "#a3be8c" },
    }

    -- Insert into lualine_x
    table.insert(opts.sections.lualine_x, 1, copilot_component)

    lualine.setup(opts)
  end
}
