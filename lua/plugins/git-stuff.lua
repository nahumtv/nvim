return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})

			-- Actions
			vim.keymap.set("n", "<leader>ghs", ":Gitsigns stage_hunk<CR>", {})
			vim.keymap.set("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>ghr", ":Gitsigns reset_hunk<CR>", {})
			--vim.keymap.set('v', '<leader>hs', function():Gitsigns stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
			--vim.keymap.set('v', '<leader>hr', function():Gitsigns reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
			--vim.keymap.set('n', '<leader>hS',:Gitsigns stage_buffer)
			--vim.keymap.set('n', '<leader>hu',:Gitsigns undo_stage_hunk)
			--vim.keymap.set('n', '<leader>hR',:Gitsigns reset_buffer)
			--vim.keymap.set('n', '<leader>hp',:Gitsigns preview_hunk)
			--vim.keymap.set('n', '<leader>hb', function():Gitsigns blame_line{full=true} end)
			--vim.keymap.set('n', '<leader>tb',:Gitsigns toggle_current_line_blame)
			--vim.keymap.set('n', '<leader>hd',:Gitsigns diffthis)
			--vim.keymap.set('n', '<leader>hD', function():Gitsigns diffthis('~') end)
			--vim.keymap.set('n', '<leader>td',:Gitsigns toggle_deleted)

			-- Text object
			--vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		end,
	},
}
