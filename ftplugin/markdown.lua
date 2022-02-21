if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
  local function map(...)
    vim.api.nvim_buf_set_keymap(0, ...)
  end
  local opts = { noremap = true, silent = false }
  map("v", "<leader>n",
      ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
end

vim.keymap.set("i", "<Tab>", function()
  local curr_line = vim.api.nvim_get_current_line()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  local start = string.find(curr_line, "|", c + 1)
  if start ~= nil and start < string.len(curr_line) then
    vim.api.nvim_win_set_cursor(0, { r, start + 1 })
  end
  vim.api.nvim_command("TableFormat")
end)

--[[
-- CR-function:
--   - if next line is table:
--     - move cursor one line down
--   - else
--     - count pipes in current line
--     - insert as many pipes below as in current line
--     - TableFormat
--     - Move cursor down one line
--]]

-- vim.keymap.set("i", "<CR>", function()
--   local l = vim.api.nvim_get_current_line()
--   local _, count = string.gsub(l, "|", "")
--   print(count)
-- end)

vim.keymap.set("n", "<Tab>", function()
  vim.api.nvim_command("TableFormat")
end)
