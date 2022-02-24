local remap = vim.api.nvim_set_keymap

remap("i", "mn", "<ESC>", {})
remap("i", "<S-CR>", "<ESC>o", {})
remap("i", "<C-BS>", "<C-w>", {})
remap("n", "<SPACE>", "<nop>", {})

vim.cmd("let mapleader=\" \"")

remap("v", "<leader>d", "\"_d", {})

vim.keymap.set("n", "<leader>c", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^tim") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  print("Config reloaded")
end)

vim.keymap.set("n", "<leader>,", function()
  require("telescope.builtin").buffers({ sort_lastused = true })
end)

vim.keymap.set("n", "<leader>.", function()
  require("telescope.builtin").find_files({})
end)

vim.keymap.set("n", "<leader><leader>", function()
  local builtin = require("telescope.builtin")
  local ok = pcall(builtin.git_files, {})
  if not ok then
    builtin.find_files({})
  end
end)

vim.keymap.set("n", "<leader>s", function()
  local opts = {}
  local git_dir = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if git_dir:find("^fatal") == nil then
    opts.cwd = git_dir
  end
  require("telescope.builtin").live_grep(opts)
end)
