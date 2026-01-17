return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "n",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,

		-- ❌ Disable auto-format on save
		format_on_save = false,

		-- Format on save function
		-- format_on_save = function(bufnr)
		-- 	local ft = vim.bo[bufnr].filetype
		-- 	local disabled_filetypes = { c = true, cpp = true }
		-- 	local lsp_format_opt = disabled_filetypes[ft] and "never" or "fallback"
		--
		-- 	return {
		-- 		timeout_ms = 500,
		-- 		lsp_format = lsp_format_opt,
		-- 	}
		-- end,

		-- Filetype-specific formatters
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "eslint_d", "prettier" },
			typescript = { "eslint_d", "prettier" },
			javascriptreact = { "eslint_d", "prettier" },
			typescriptreact = { "eslint_d", "prettier" },
			svelte = { "eslint_d", "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			liquid = { "prettier" },
			python = { "isort", "black" },
		},
	},

	formatters = {
		eslint_d = {
			command = "eslint_d",
			args = {
				"--stdin",
				"--stdin-filename",
				"$FILENAME",
				"--fix",
			},
			stdin = true,
		},
	},
	-- Optional: custom config callback after plugin loads
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
