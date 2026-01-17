-- Disable unused language providers (MUY IMPORTANTE)
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Lazy.nvim install check
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},

	-- 🔥 DESACTIVAR checker es CLAVE para que no haya delay al abrir EL PRIMER archivo
	checker = {
		enabled = false, -- antes lo tenías en true (causaba IO extra)
		notify = false,
	},

	performance = {
		rtp = {
			-- Desactiva plugins de Vim que no sirven y cargan lento
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"zipPlugin",
				"tohtml",
				"tutor",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
			},
		},
	},

	-- Lazy UI (sin impacto en rendimiento)
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤",
		},
	},
})
