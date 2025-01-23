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

			-- Define additional fields that the plugin expects
			padding = true, -- Adds padding between the comment delimiter and the comment text
			sticky = true, -- Keeps the comment delimiter on the same line when the line is too short
			ignore = nil, -- Ignoring certain lines, set to `true` if you want to ignore empty lines, comments, etc.

			-- Define key mappings for toggling comments
			toggler = {
				line = "<leader>cl", -- Toggle comment for a single line
				block = "<leader>cb", -- Toggle comment for a block of code
			},

			-- Key mappings for operator-pending mode (e.g., visual selection)
			opleader = {
				line = "<leader>cl", -- Comment a line in visual mode
				block = "<leader>cb", -- Comment a block in visual mode
			},

			-- Extra options for commenting above, below, or at the end of the line
			extra = {
				above = "<leader>cO", -- Comment above the current line
				below = "<leader>co", -- Comment below the current line
				eol = "<leader>c_", -- Comment at the end of the line
			},

			-- Configure post_hook if you need to run any action after commenting
			post_hook = nil, -- Set this to a function if you need to execute something after commenting

			-- Configure the mappings section
			mappings = {
				basic = true, -- Use default key mappings for toggling comments, etc.
				extra = true, -- Use extra mappings for above, below, and at the end of the line
				extended = false, -- Disable extended mappings like for visual block mode, if you prefer
			},
		})
	end,
}
