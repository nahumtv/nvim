return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Spectre",
	keys = {
		{
			"<leader>sr",
			function()
				require("spectre").open()
			end,
			desc = "Open Spectre (Project wide search & Replace)",
		},
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Search word under cursor (Spectre)",
			mode = { "n", "v" },
		},
		{
			"<leader>sp",
			function()
				require("spectre").open_file_search()
			end,
			desc = "Search in current file (Spectre)",
		},
	},

	config = function()
		require("spectre").setup({
			color_devicons = true,
			live_update = false,
			open_cmd = "vnew",

			-- ============================================================
			-- ⭐ Modern UI: Borders, spacing, padding, icons
			-- ============================================================
			default = {
				border = "rounded",
				winhl = {
					border = "FloatBorder",
					normal = "NormalFloat",
				},
			},

			highlight = {
				ui = "Title",
				search = "IncSearch",
				replace = "DiffDelete",
				border = "FloatBorder",
			},

			-- Líneas decorativas más limpias
			line_sep_start = "┌───────────────────────────────────────────────",
			result_padding = "│ ",
			line_sep = "└───────────────────────────────────────────────",

			-- ============================================================
			-- ⭐ Keymaps UI-friendly
			-- ============================================================
			mapping = {
				["toggle_line"] = {
					map = "t",
					cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
					desc = "Toggle current item",
				},
				["enter_file"] = {
					map = "<CR>",
					cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
					desc = "Jump to file",
				},
				["send_to_qf"] = {
					map = "Q",
					cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
					desc = "Send results to Quickfix",
				},
				["replace_cmd"] = {
					map = "c",
					cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
					desc = "Replace command",
				},
				["show_option_menu"] = {
					map = "o",
					cmd = "<cmd>lua require('spectre').show_options()<CR>",
					desc = "Options menu",
				},
				["run_replace"] = {
					map = "R",
					cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
					desc = "Replace all",
				},
				["change_view_mode"] = {
					map = "m",
					cmd = "<cmd>lua require('spectre').change_view()<CR>",
					desc = "Toggle view mode",
				},
			},
		})
	end,
}
