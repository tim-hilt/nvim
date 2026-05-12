vim.pack.add({
	"https://github.com/smoka7/hop.nvim",
	"https://github.com/max397574/better-escape.nvim",
	"https://github.com/HiPhish/rainbow-delimiters.nvim"
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

vim.keymap.set("n", "'", function() vim.cmd(":wa") end)

vim.wo.number = true

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

