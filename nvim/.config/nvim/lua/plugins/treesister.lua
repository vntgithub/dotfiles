return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
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
			"python",
			"markdown",
			"markdown_inline",
			"bash",
			"gitcommit",
			"toml",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
