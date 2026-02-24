return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = "auto",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },

  config = function(_, opts)
    local lualine = require("lualine")

    lualine.setup(opts)

    -- Insert Copilot status component into lualine_x
    table.insert(opts.sections.lualine_x, 2, {
      function()
        local ok, copilot = pcall(require, "copilot")
        if not ok then
          return ""
        end

        local clients = vim.lsp.get_clients({ name = "copilot", bufnr = 0 })
        if #clients == 0 then
          return ""
        end

        local status = require("copilot.status").data.status

        if status == "InProgress" then
          return " Copilot"
        elseif status == "Warning" then
          return " Copilot"
        else
          return " Copilot"
        end
      end,
      color = { fg = "#A6E3A1" },
    })
  end
}
