if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
  local function map(...)
    vim.api.nvim_buf_set_keymap(0, ...)
  end
  local opts = { noremap = true, silent = false }
  map("v", "<leader>n",
      ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
end

vim.api.nvim_exec([[
  nnoremap <buffer> <Tab> :TableFormat<CR>
  inoremap <buffer> <Tab> <Esc>:TableFormat<CR>i
]], true)
