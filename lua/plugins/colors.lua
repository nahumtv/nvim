return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Load this before other start plugins
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = {
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		show_end_of_buffer = true,
		term_colors = true,
		styles = {
			comments = { "italic" },
			conditionals = { "bold" },
			functions = { "bold" },
			keywords = {},
			strings = {},
			variables = {},
		},
		integrations = {
			nvimtree = true,
			telescope = true,
			treesitter = true,
			which_key = true,
			-- add more integrations if needed
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin") -- Apply the colorscheme
	end,
}
