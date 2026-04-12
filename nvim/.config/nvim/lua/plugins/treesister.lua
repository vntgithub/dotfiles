return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- 1. Install parsers
		require("nvim-treesitter").install({
			"lua",
			"vim",
			"vimdoc",
			"query",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"elixir",
			"heex",
			"eex",
			"ruby",
			"go",
			"gomod",
			"dockerfile",
			"json",
			"yaml",
			"cpp",
			"vue",
		})

		-- 2. Enable Treesitter highlighting (IMPORTANT)
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- start treesitter for this buffer
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
