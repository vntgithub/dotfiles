return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",

  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = false,
      keymap = {
        accept = false, -- handled manually
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },

  config = function(_, opts)
    require("copilot").setup(opts)

    -- Accept Copilot suggestion (like LazyVim ai_accept)
    vim.keymap.set("i", "<Tab>", function()
      local suggestion = require("copilot.suggestion")
      if suggestion.is_visible() then
        suggestion.accept()
        return ""
      else
        return "<Tab>"
      end
    end, { expr = true, silent = true })
  end,
}
