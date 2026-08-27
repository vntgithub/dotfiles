return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        term_colors = true,
        float = {
          transparent = true,
        },
        auto_integrations = true,
        integrations = {
          -- Match tmux/kitty mauve accent (default lualine NORMAL is blue)
          lualine = {
            all = function(colors)
              return {
                normal = {
                  a = { bg = colors.mauve, fg = colors.mantle, gui = "bold" },
                  b = { bg = colors.surface0, fg = colors.mauve },
                },
                visual = {
                  a = { bg = colors.lavender, fg = colors.mantle, gui = "bold" },
                  b = { bg = colors.surface0, fg = colors.lavender },
                },
                inactive = {
                  a = { fg = colors.mauve },
                },
              }
            end,
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
