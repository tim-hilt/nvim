vim.pack.add(
    {
        "https://github.com/smoka7/hop.nvim",
        "https://github.com/max397574/better-escape.nvim",
        "https://github.com/HiPhish/rainbow-delimiters.nvim",
        "https://github.com/tpope/vim-sleuth",
        "https://github.com/lewis6991/gitsigns.nvim",
        "https://github.com/windwp/nvim-autopairs",
        "https://github.com/neogitorg/neogit",
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/nvim-telescope/telescope.nvim",
        "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/windwp/nvim-autopairs",
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
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.autoindent = true

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

require("nvim-autopairs").setup()

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    -- Visual-mode formatting
    vim.keymap.set("v", "<leader>q", [[:s/^/> /<CR>:nohlsearch<CR>]],
      vim.tbl_extend("force", opts, { desc = "Markdown quote" }))
    vim.keymap.set("v", "<leader>b", [[:s/^\(\s*\)\(.*\S\)\s*$/\1**\2**/<CR>:nohlsearch<CR>]],
      vim.tbl_extend("force", opts, { desc = "Markdown bold" }))
    vim.keymap.set("v", "<leader>i", [[:s/^\(\s*\)\(.*\S\)\s*$/\1*\2*/<CR>:nohlsearch<CR>]],
      vim.tbl_extend("force", opts, { desc = "Markdown italic" }))

    -- <CR>: continue a list item, otherwise a normal newline
    local function list_enter()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- row 1-based, col 0-based
      local line = vim.api.nvim_get_current_line()
      local indent = line:match("^(%s*)%- ")

      if not indent then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
        return
      end

      -- Empty item: clear the marker and stay on a blank line
      if line:match("^%s*%- %s*$") then
        vim.api.nvim_set_current_line("")
        return
      end

      -- Split the line at the cursor and write the new line ourselves,
      -- so autoindent can't add extra indentation
      local before = line:sub(1, col)
      local after = line:sub(col + 1)
      local new = indent .. "- "
      vim.api.nvim_buf_set_lines(0, row - 1, row, true, { before, new .. after })
      vim.api.nvim_win_set_cursor(0, { row + 1, #new })
    end

    vim.keymap.set("i", "<CR>", list_enter,
      vim.tbl_extend("force", opts, { desc = "Continue markdown list" }))

    -- <Tab>: indent a list item, otherwise a normal tab
    vim.keymap.set("i", "<Tab>", function()
      if vim.api.nvim_get_current_line():match("^%s*%- ") then
        return "<C-t>"
      end
      return "<Tab>"
    end, vim.tbl_extend("force", opts, { expr = true, desc = "Indent markdown list item" }))

    -- <S-Tab>: outdent one level
    vim.keymap.set("i", "<S-Tab>", "<C-d>",
      vim.tbl_extend("force", opts, { desc = "Outdent" }))
  end,
})
