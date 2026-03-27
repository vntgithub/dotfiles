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
			ensure_installed = {
				"lua_ls",
				"gopls",
				"ruby_lsp",
        "elixirls",
				"vue_ls",
				"tailwindcss",
				"eslint",
				"clangd",
				"vtsls",
			},
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

			local vue_language_server_path = vim.fn.stdpath("data")
				.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

			local vue_plugin = {
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
				configNamespace = "typescript",
			}

			-- Configure all servers BEFORE enabling them
			vim.lsp.config("vtsls", {
				capabilities = capabilities,
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								vue_plugin,
							},
						},
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			})

			vim.lsp.config("vue_ls", {
				capabilities = capabilities,
				settings = {
					init_options = {
						typescript = {
							tsdk = "",
						},
					},
				},
			})

			vim.lsp.config("elixirls", {
				capabilities = capabilities,
				root_markers = { "mix.exs", ".git" },
				settings = {
					elixirLS = {
						dialyzerEnabled = true,
						fetchDeps = false,
						enableTestLenses = true,
						suggestSpecs = true,
					},
				},
			})

			-- Simple servers that only need capabilities
			local simple_servers = {
				"lua_ls",
				"gopls",
				"ruby_lsp",
				"clangd",
				"tailwindcss",
				"eslint",
			}
			for _, name in ipairs(simple_servers) do
				vim.lsp.config(name, { capabilities = capabilities })
			end

			-- Enable all servers (after all configs are set)
			local all_servers = {
				"lua_ls",
				"gopls",
				"ruby_lsp",
				"elixirls",
				"clangd",
				"tailwindcss",
				"eslint",
				"vtsls",
				"vue_ls",
			}
			for _, name in ipairs(all_servers) do
				vim.lsp.enable(name)
			end

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
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
