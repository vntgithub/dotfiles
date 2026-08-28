return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    filetypes = {
      "*",
      css = { rgb_fn = true },
      html = { names = false },
    },
    user_default_options = {
      names = true,
      rgb_fn = true,
    },
  },
}
