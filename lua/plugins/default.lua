-- Activar module loader (Neovim 0.9+ / recomendado en 0.11)
if vim.loader then
	vim.loader.enable()
end

return {
	{
		-- Auto-detecta indentación (tabstop, shiftwidth)
		"tpope/vim-sleuth",

		-- Plugins adicionales
		{
			"echasnovski/mini.nvim",
			version = false, -- Siempre usa la versión más reciente (recomendado en 0.11)
			lazy = true,
			event = "VeryLazy",

			config = function()
				-- ================================
				--       MINI.AI (textobjects)
				-- ================================
				require("mini.ai").setup({
					n_lines = 500,
				})

				-- ================================
				--       MINI.SURROUND
				-- ================================
				require("mini.surround").setup()

				-- ================================
				--       MINI.STATUSLINE
				-- ================================
				local statusline = require("mini.statusline")

				statusline.setup({
					use_icons = vim.g.have_nerd_font,
				})

				statusline.section_location = function()
					return "%2l:%-2v" -- LINE:COLUMN
				end

				-- ------------------------------------------------------------
				-- Opcional: integrar más módulos modernos en Neovim 0.11
				-- ------------------------------------------------------------

				-- mini.pairs (alternativa ligera a nvim-autopairs)
				require("mini.pairs").setup()

				-- mini.comment (Neovim 0.11 trae improvements, pero esto es más estable)
				require("mini.comment").setup()

				-- mini.pick (nuevo telescope-like built-in de mini.nvim)
				-- require("mini.pick").setup()

				-- mini.notify (reemplaza a vim.notify con UI moderna)
				-- require("mini.notify").setup()
				-- vim.notify = require("mini.notify").make_notify()
			end,
		},

		-- ================================
		--   Importa tus plugins custom
		--   (Recomendado en 0.11)
		-- ================================
		-- { import = "custom.plugins" },
	},
}
