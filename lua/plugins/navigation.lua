-- Skip Treesitter context_commentstring module auto-loading
vim.g.skip_ts_context_commentstring_module = true

return {
	-- NvimTree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sort_by = "case_sensitive",
			renderer = {
				group_empty = true,
				highlight_git = true,
			},
			filters = {
				dotfiles = false,
				custom = { "^\\.git$" },
			},
			update_focused_file = { enable = true, update_cwd = true },
			git = { enable = true, ignore = false, timeout = 400 },
		},
		keys = {
			{ "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle NvimTree" },
		},
		config = function(_, opts)
			local api = require("nvim-tree.api")

			require("nvim-tree").setup(vim.tbl_deep_extend("force", opts, {
				on_attach = function(bufnr)
					-- Helper function
					local function map(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
					end

					-- Navigation
					map("h", api.node.navigate.parent_close, "Close folder / go to parent")
					map("l", api.node.open.edit, "Open file/folder")
					map("<CR>", api.node.open.edit, "Open file/folder")
					map("u", api.tree.change_root_to_parent, "Go to parent directory")

					-- FS actions
					map("r", api.fs.rename, "Rename file")
					map("a", api.fs.create, "Create file/folder")
					map("d", api.fs.remove, "Delete file/folder")

					-- 📌 Copy/Cut/Paste
					map("c", api.fs.copy.node, "Copy file/folder")
					map("x", api.fs.cut, "Cut file/folder")
					map("p", api.fs.paste, "Paste file/folder")
				end,
			}))
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		event = { "BufReadPost", "BufNewFile" },

		opts = {
			ensure_installed = {
				"bash",
				"c",
				"html",
				"lua",
				"markdown",
				"markdown_inline",
				"javascript",
				"typescript",
				"tsx",
				"css",
				"json",
				"python",
			},

			highlight = {
				enable = true,
				-- 🔥 evita el lag en archivos grandes
				disable = function(lang, buf)
					local max_filesize = 500 * 1024 -- 500 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},

			indent = { enable = true },

			-- 🔥 Desactiva textobjects (causa lag)
			textobjects = { enable = false },

			-- 🔥 Desactiva incremental selection (lento)
			incremental_selection = { enable = false },
		},
	},

	-- ts_context_commentstring (replacement for deprecated module)
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		config = function()
			require("ts_context_commentstring").setup({})
		end,
	},
}
