return {
	--	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
		"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

		-- NOTE: Plugins can also be added by using a table,
		-- with the first argument being the link and the following
		-- keys can be used to configure plugin behavior/loading/etc.
		--
		-- Use `opts = {}` to force a plugin to be loaded.
		-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
		--
		-- This is often very useful to both group configuration, as well as handle
		-- lazy loading plugins that don't need to be loaded immediately at startup.
		--
		-- For example, in the following configuration, we use:
		--  event = 'VimEnter'
		--
		-- which loads which-key before all the UI elements are loaded. Events can be
		-- normal autocommands events (`:help autocmd-events`).
		--
		-- Then, because we use the `config` key, the configuration only runs
		-- after the plugin has been loaded:
		--  config = function() ... end

		-- NOTE: Plugins can specify dependencies.
		--
		-- The dependencies are proper plugin specifications as well - anything
		-- you do for a plugin at the top level, you can do for a dependency.
		--
		-- Use the `dependencies` key to specify the dependencies of a particular plugin
		-- LSP Plugins

		{ -- Collection of various small independent plugins/modules
			"echasnovski/mini.nvim",
			config = function()
				-- Better Around/Inside textobjects
				--
				-- Examples:
				--  - va)  - [V]isually select [A]round [)]paren
				--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
				--  - ci'  - [C]hange [I]nside [']quote
				require("mini.ai").setup({ n_lines = 500 })

				-- Add/delete/replace surroundings (brackets, quotes, etc.)
				--
				-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
				-- - sd'   - [S]urround [D]elete [']quotes
				-- - sr)'  - [S]urround [R]eplace [)] [']
				require("mini.surround").setup()

				-- Simple and easy statusline.
				--  You could remove this setup call if you don't like it,
				--  and try some other statusline plugin
				local statusline = require("mini.statusline")
				-- set use_icons to true if you have a Nerd Font
				statusline.setup({ use_icons = vim.g.have_nerd_font })

				-- You can configure sections in the statusline by overriding their
				-- default behavior. For example, here we set the section for
				-- cursor location to LINE:COLUMN
				---@diagnostic disable-next-line: duplicate-set-field
				statusline.section_location = function()
					return "%2l:%-2v"
				end

				-- ... and there is more!
				--  Check out: https://github.com/echasnovski/mini.nvim
			end,
		},

		-- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
		-- init.lua. If you want these files, they are in the repository, so you can just download them and
		-- place them in the correct locations.

		-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
		--
		--  Here are some example plugins that I've included in the Kickstart repository.
		--  Uncomment any of the lines below to enable them (you will need to restart nvim).
		--
		-- require 'kickstart.plugins.debug',
		-- require 'kickstart.plugins.indent_line',
		-- require 'kickstart.plugins.lint',
		-- require 'kickstart.plugins.autopairs',
		-- require 'kickstart.plugins.neo-tree',
		-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

		-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
		--    This is the easiest way to modularize your config.
		--
		--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
		--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
		-- { import = 'custom.plugins' },
	},
}
