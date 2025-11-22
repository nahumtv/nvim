return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Linters por filetype
		lint.linters_by_ft = {
			python = { "flake8", "pylint" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
			react = { "eslint" },
			graphql = { "eslint", "graphql" },
			html = { "eslint", "htmlhint" },
			css = { "eslint" },
			tailwindcss = { "eslint" },
			json = { "jsonlint" },
			yaml = { "yamllint" },
			markdown = { "markdownlint" },
			dockerfile = { "hadolint" },
		}
		-- ============================================================================
		-- Safe function to run linting without breaking Neovim
		-- ============================================================================
		local function safe_lint()
			pcall(lint.try_lint)
		end

		-- ============================================================================
		-- Keymap: Show diagnostics for the current line manually
		-- ============================================================================
		-- Avoids automatic popups on CursorHold; show only when requested
		vim.keymap.set("n", "<leader>dl", function()
			-- Optionally update linting before showing diagnostics
			safe_lint()
			vim.diagnostic.open_float(nil, {
				focus = false, -- Do not focus the floating window
				scope = "line", -- Only show diagnostics for the current line
				border = "rounded", -- Rounded border for better visual separation
			})
		end, { desc = "Show LSP diagnostics manually for the current line" })

		-- ============================================================================
		-- Keymap: Trigger linting manually for the entire file
		-- ============================================================================
		vim.keymap.set("n", "<leader>ll", safe_lint, {
			desc = "Trigger linting for the current file",
			noremap = true,
			silent = true,
		})

		-- ============================================================================
		-- Optional: automatic linting on buffer events
		-- Disabled to give full manual control, uncomment if desired
		-- ============================================================================
		-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		--   group = lint_augroup,
		--   callback = safe_lint,
		--   desc = "Run linters automatically on buffer events",
		-- })

		-- ============================================================================
		-- Optional: automatic floating diagnostics on CursorHold
		-- Disabled to avoid distractions; use <leader>dl instead
		-- ============================================================================
		-- vim.api.nvim_create_autocmd("CursorHold", {
		-- 	group = lint_augroup,
		-- 	callback = function()
		-- 		safe_lint()
		-- 		vim.diagnostic.open_float(nil, { focus = false })
		-- 	end,
		-- 	desc = "Show linting diagnostics on cursor hover",
		-- })

		-- Don't show a floating window when hovering over the error
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			float = {
				border = "rounded",
				focusable = false,
			},
		})
	end,
}
