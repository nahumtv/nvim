-- File: lua/plugins/git.lua
return {

	-- 1. Git core commands
	{
		"tpope/vim-fugitive",
		cmd = {
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
		},
		keys = {
			{ "<leader>gg", "<cmd>Git<cr>", desc = "Git status (Fugitive)" },
		},
	},

	-- 2. Git signs (gutter, actions, hunk navigation)
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return {
				signs = {
					add = { text = "+" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				current_line_blame = false,

				on_attach = function(bufnr)
					local gs = require("gitsigns")
					--- @param mode string|string[]
					--- @param lhs string
					--- @param rhs fun()|string
					--- @param desc string
					local function map(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gs.nav_hunk("next")
						end
					end, "Next hunk")

					map("n", "[c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gs.nav_hunk("prev")
						end
					end, "Previous hunk")

					-- Actions
					map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
					map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")

					map("v", "<leader>hs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, "Stage selection")

					map("v", "<leader>hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, "Reset selection")
					map("n", "<leader>hS", gs.stage_buffer, "Stage entire buffer")
					map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
					map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
					map("n", "<leader>hD", function()
						gs.diffthis("~")
					end, "Diff against previous commit")
					map("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end, "Blame line")

					map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle line blame")
					map("n", "<leader>hd", gs.diffthis, "Diff this file")
					map("n", "<leader>td", gs.toggle_deleted, "Show deleted lines")
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
				end,
			}
		end,
	},

	-- 3. Magit-like interface
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		keys = {
			{ "<leader>gn", "<cmd>Neogit<cr>", desc = "Open Neogit" },
		},
		opts = {
			disable_commit_confirmation = true,
			integrations = { diffview = true },
			signs = {
				section = { "", "" },
				item = { "", "" },
			},
		},
	},

	-- 4. Diff viewer
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Git file history" },
		},
		opts = {
			enhanced_diff_hl = true,
			view = {
				merge_tool = {
					layout = "diff3_horizontal",
				},
			},
		},
	},
}
