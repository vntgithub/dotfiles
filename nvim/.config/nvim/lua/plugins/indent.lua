return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "┆",
      tab_char = "┆",
    },
    scope = {
      enabled = false, -- This highlights the specific 'if' block you are inside
      show_start = false,
      show_end = false,
      char = "▎",
      highlight = { "Function", "Label" },
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
      },
    },
  },
}

