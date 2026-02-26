return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = { "lua_ls", "gopls", "ruby_lsp", "elixirls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      servers = {
        -- copilot.lua only works with its own copilot lsp server
        copilot = { enabled = false },
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = { "lua_ls", "gopls", "ruby_lsp", "elixir_ls" }
      for _, name in ipairs(servers) do
        vim.lsp.config(name, { capabilities = capabilities })
        vim.lsp.enable(name)
      end

      vim.lsp.config("elixir_ls", {
        -- Mason automatically puts the executable in Neovim's path
        cmd = { "elixir-ls" },

        -- The root_dir is important for Phoenix umbrella apps or standard apps
        root_dir = require("lspconfig.util").root_pattern("mix.exs", ".git"),

        settings = {
          elixirLS = {
            -- Dialyzer can be very slow to build the first time, set to false if it hangs
            dialyzerEnabled = true,
            -- Don't automatically fetch deps on every save
            fetchDeps = false,
            enableTestLenses = true,
            suggestSpecs = true,
          },
        },
      })

    --  format on save file
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
      -- LSP keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
      vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "gf", vim.lsp.buf.format, { desc = "Format" })
      vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "Rename" })
    end,
  },
}
