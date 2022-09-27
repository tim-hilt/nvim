local M = {}

M.config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	telescope.setup({
		defaults = {
			mappings = { i = { ["<esc>"] = actions.close } },
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
		pickers = {
			find_files = {
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
			},
		},
	})
	local extensions = { "fzf" }
	for _, extension in ipairs(extensions) do
		telescope.load_extension(extension)
	end
end

return M
