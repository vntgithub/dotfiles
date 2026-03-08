return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },

				-- FIXES HERE:
				go = { "goimports", "gofmt" },
				elixir = { "mix" }, -- Changed from "mix_format" to "mix"
				cpp = { "clang-format" },

				-- Global fallback
				["*"] = { "trim_whitespace" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
