vim.pack.add(
    {
        "https://github.com/smoka7/hop.nvim",
        "https://github.com/max397574/better-escape.nvim",
        "https://github.com/HiPhish/rainbow-delimiters.nvim",
        "https://github.com/lewis6991/gitsigns.nvim",
        "https://github.com/windwp/nvim-autopairs",
        "https://github.com/neogitorg/neogit",
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/nvim-telescope/telescope.nvim",
        "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
    }
)

local hop = require("hop")
hop.setup({keys = "enaistcr,h/.vdqj"})
vim.keymap.set("n", "s", hop.hint_char2)

require("better_escape").setup {
    default_mappings = false,
    mappings = {
        i = {
            m = {
                n = "<Esc>"
            }
        }
    }
}

vim.wo.number = true

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.undofile = true

vim.g.mapleader = " "

vim.api.nvim_create_autocmd(
    "BufReadPost",
    {
        callback = function()
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
                vim.api.nvim_win_set_cursor(0, mark)
            end
        end
    }
)

vim.keymap.set(
    "n",
    "'",
    function()
        vim.cmd(":wa")
    end
)
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", {desc = "Open Neogit UI"})

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup(
    {
        defaults = {
            mappings = {i = {["<esc>"] = actions.close}},
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = "top"
            }
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        },
        pickers = {
            find_files = {
                find_command = {"fd", "--type", "f", "--strip-cwd-prefix"}
            }
        }
    }
)
local extensions = {"fzf"}

for _, extension in ipairs(extensions) do
    telescope.load_extension(extension)
end

vim.keymap.set(
    "n",
    "<leader><leader>",
    function()
        local opts = {}
        local git_dir = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if git_dir:find("^fatal") == nil then
            opts.cwd = git_dir
        end
        require("telescope.builtin").find_files(opts)
    end
)
