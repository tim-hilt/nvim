vim.pack.add({
	"https://github.com/smoka7/hop.nvim",
	"https://github.com/max397574/better-escape.nvim",
	"https://github.com/HiPhish/rainbow-delimiters.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/neogitorg/neogit"
})

local hop = require("hop")
hop.setup({ keys = "enaistcr,h/.vdqj" })
vim.keymap.set("n", "s", hop.hint_char2)

require("better_escape").setup {
    default_mappings = false,
    mappings = {
        i = {
            m = {
                n = "<Esc>"
            },
        },
    },
}

require("rainbow-delimiters.setup").setup()

vim.wo.number = true

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.undofile = true

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

vim.keymap.set("n", "'", function() vim.cmd(":wa") end)
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })

