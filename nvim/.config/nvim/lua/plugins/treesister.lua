return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  branch = "master", -- CRITICAL: Use master for Neovim 0.10 and the old config style
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc", "query",
      "html", "css", "javascript", "typescript", "tsx",
      "elixir", "heex", "eex",
      "ruby",
      "gomod", "go",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    -- On the 'master' branch, the module is named 'nvim-treesitter.configs'
    require("nvim-treesitter.configs").setup(opts)
  end,
}
