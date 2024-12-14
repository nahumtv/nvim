return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- Import comment plugin safely
		local comment = require("Comment")
		-- Import context-aware comment string
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- Enable Comment.nvim with a pre-hook for context-aware comments
		comment.setup({
			pre_hook = ts_context_commentstring.create_pre_hook(), -- For dynamic comment strings
		})

		-- Optional: Explicitly set key mappings for gcc and gc
		-- For toggling comment on the current line
		vim.api.nvim_set_keymap(
			"n",
			"gcc",
			'<Cmd>lua require("Comment.api").toggle_current_line()<CR>',
			{ noremap = true, silent = true }
		)

		-- For toggling comment on the selected visual block
		vim.api.nvim_set_keymap(
			"v",
			"gc",
			'<Cmd>lua require("Comment.api").toggle_visual()<CR>',
			{ noremap = true, silent = true }
		)
	end,
}
