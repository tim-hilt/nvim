local M = {}

M.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"go",
			"tsx",
			"typescript",
			"javascript",
			"lua",
			"fish",
			"comment",
			"cpp",
		},
		highlight = { enable = true },
		autotag = { enable = true },
		rainbow = { enable = true },
	})
end

return M
