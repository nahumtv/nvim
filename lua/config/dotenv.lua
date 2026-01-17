local M = {}

function M.setup()
	-- Detect .env files
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = { ".env", ".env.*" },
		callback = function()
			vim.bo.filetype = "sh"
		end,
	})

	-- Lightweight KEY=VALUE highlighting
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "sh",
		callback = function()
			vim.cmd([[
        syntax match dotenvKey "^\s*\zs[A-Z0-9_]\+\ze="
        syntax match dotenvValue "=\zs.*$"
        highlight link dotenvKey Identifier
        highlight link dotenvValue String
      ]])
		end,
	})

	-- Folding
	vim.o.foldmethod = "expr"
	vim.o.foldexpr = "nvim_treesitter#foldexpr()"
	vim.o.foldlevel = 99
	vim.keymap.set("n", "<leader>z", "za", { desc = "Toggle fold" })
end

return M
