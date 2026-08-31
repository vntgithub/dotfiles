return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        -- noice queries every attached client; one empty reply would notify
        -- even when another client already showed the hover popup
        hover = { silent = true },
      },
      presets = {
        -- noice hover uses nui and ignores vim.o.winborder
        lsp_doc_border = true,
      },
    },
  },
}
