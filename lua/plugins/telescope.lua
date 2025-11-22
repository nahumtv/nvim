return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},

	opts = function()
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")

		return {
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ",
				path_display = { "smart" },
				dynamic_preview_title = true,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				file_ignore_patterns = {
					"node_modules/",
					"dist/",
					"build/",
					"%.lock",
					"%.min%.js",
					".git/",
				},

				layout_strategy = "flex",

				layout_config = {
					horizontal = {
						preview_width = 0.55,
						width = 0.90,
					},
					vertical = {
						preview_height = 0.45,
					},
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-v>"] = actions.select_vertical,
						["<C-h>"] = actions.select_horizontal,
						["<Esc>"] = actions.close,
					},
				},
			},

			pickers = {
				-- find_files con fd (rápido)
				find_files = {
					hidden = true,
					find_command = {
						vim.fn.executable("fd") == 1 and "fd" or "fdfind",
						"--type",
						"f",
						"--strip-cwd-prefix",
						"--hidden",
						"--exclude",
						".git",
					},
				},

				live_grep = {
					additional_args = function()
						return { "--hidden", "--glob=!.git/*" }
					end,
				},
			},

			extensions = {
				["ui-select"] = themes.get_dropdown(),
			},
		}
	end,

	config = function(_, opts)
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")

		telescope.setup(opts)

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		local map = vim.keymap.set

		--------------------------
		-- 📌 Search Keymaps
		--------------------------

		map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		map("n", "<leader><leader>", builtin.buffers, { desc = "Find Buffers" })

		--------------------------
		-- 📁 File Search
		--------------------------
		map("n", "<leader>sf", function()
			builtin.find_files({ hidden = true })
		end, { desc = "[S]earch [F]iles" })

		--------------------------
		-- 🔍 Grep
		--------------------------
		map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch [W]ord" })

		--------------------------
		-- 🗂 Buffers & system
		--------------------------
		map("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
		map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		map("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files" })

		--------------------------
		-- 🔎 Fuzzy current buffer
		--------------------------
		map("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown({
				previewer = false,
				winblend = 10,
			}))
		end, { desc = "Fuzzy search buffer" })

		--------------------------
		-- 🔥 Live grep SOLO en open files
		--------------------------
		map("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] Open Files Only" })

		--------------------------
		-- 🔧 Search Neovim config
		--------------------------
		map("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search Neovim config" })
	end,
}
