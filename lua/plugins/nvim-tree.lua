return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
	end,

	init = function()
		vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")
	end,
}
