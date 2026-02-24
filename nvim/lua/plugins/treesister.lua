return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        -- Elixir
        "elixir",
        "heex",
        "eex",

        -- Go
        "go",
        "gomod",
        "gowork",
        "gosum",

        -- Ruby on Rails
        "ruby",
        "erb",

        -- General Web/Backend
        "bash",
        "html",
        "css",
      })
    end
  end,
}
