vim.o.cursorline = true
vim.o.syntax = "on"
vim.o.number = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 5
vim.o.autochdir = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true
vim.o.pyxversion = 3
vim.o.bri = true
vim.o.briopt = "min:20,shift:4,sbr,list:2"
vim.o.lbr = true
vim.o.signcolumn = "yes"
vim.o.laststatus = 3
vim.o.mouse = nil

vim.diagnostic.config { virtual_text = false }

vim.api.nvim_set_var("python3_host_prog", "/usr/bin/python")

vim.api.nvim_exec([[
  set clipboard+=unnamedplus
  filetype plugin indent on
  set noswapfile
  set noshowmode
]], true)

local format_on_save = "format_on_save"
vim.api.nvim_create_augroup(format_on_save, { clear = true })
vim.api.nvim_create_autocmd({
  "BufWritePost *.lua,*.json,*.html,*.js,*.ts,*.tsx,*.cpp"
}, { command = "FormatWrite", group = format_on_save })

local disabled_built_ins = {
  "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers",
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin", "getscript",
  "getscriptPlugin", "vimball", "vimballPlugin", "2html_plugin",
  "logipat", "rrhelper", "spellfile_plugin", "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
