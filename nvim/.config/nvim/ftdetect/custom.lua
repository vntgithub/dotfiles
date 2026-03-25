-- Register custom filetypes for LSP server support.
-- This maps file extensions/patterns to filetype names.
-- Empty syntax/*.vim files in this config register the filetype
-- names so :LspInfo doesn't show "Unknown filetype" warnings.

vim.filetype.add({
	extension = {
		-- Elixir/Phoenix
		eex = "eelixir",
		leex = "eelixir",
		sface = "surface",
		heex = "heex",

		-- Go
		templ = "templ",
		gowork = "gowork",
		gotmpl = "gotmpl",
		gohtml = "gohtml",
		gohtmltmpl = "gohtmltmpl",

		-- Web templating
		mdx = "mdx",
		njk = "njk",
		hbs = "handlebars",
		ejs = "ejs",
		mustache = "mustache",
		slim = "slim",
		jade = "jade",
		leaf = "leaf",
		twig = "twig",
		erb = "erb",

		-- CSS preprocessors
		postcss = "postcss",
		sugarss = "sugarss",

		-- Other
		re = "reason",
		res = "rescript",
	},
	filename = {
		["go.work"] = "gowork",
	},
	pattern = {
		[".*%.cshtml"] = "aspnetcorerazor",
		[".*%.razor"] = "razor",
		[".*%.blade%.php"] = "blade",
		[".*%.edge"] = "edge",
		[".*%.nunjucks"] = "nunjucks",
		[".*%.djhtml"] = "django-html",
		[".*%.go%.tmpl"] = "gotmpl",
		[".*%.astro%.md"] = "astro-markdown",
		[".*%.html%.eex"] = "html-eex",
	},
})
