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

vim.api.nvim_set_var("rainbow_active", 1)
vim.api.nvim_set_var("python3_host_prog", "/usr/bin/python")

vim.api.nvim_exec([[
  set clipboard+=unnamedplus
  filetype plugin indent on
  set noswapfile
  set noshowmode

  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua,*.json,*.html,*.js,*.ts,*.tsx FormatWrite
  augroup END

  augroup neovim_last_position
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
  augroup END
]], true)
