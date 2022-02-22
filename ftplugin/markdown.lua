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
  local _, num_pipes = string.gsub(curr_line, "|", "")

  if num_pipes < 3 then
    return
  else
    vim.api.nvim_command("TableFormat")
  end

  curr_line = vim.api.nvim_get_current_line() -- Have to call again, because line has changed
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  local start = string.find(curr_line, "|", c + 1)

  if start ~= nil and start < string.len(curr_line) then
    vim.api.nvim_win_set_cursor(0, { r, start + 1 })
  end
end)

vim.keymap.set("i", "<S-Tab>", function()
  local curr_line = vim.api.nvim_get_current_line()
  local _, num_pipes = string.gsub(curr_line, "|", "")

  if num_pipes < 3 then
    return
  else
    vim.api.nvim_command("TableFormat")
  end

  curr_line = vim.api.nvim_get_current_line()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  local b = 1 -- loop through string from beginning
  local i = 1
  local pipe_positions = {}

  while true do
    local x, y = string.find(curr_line, "|", b)
    if x == nil or y >= c then
      break
    end
    b = y + 1 -- b now holds the the position of the previous pipe
    pipe_positions[i] = b
    i = i + 1
  end

  if #pipe_positions < 2 then
    return
  else
    vim.api.nvim_win_set_cursor(0, { r, pipe_positions[i - 2] })
  end

end)

-- TODO: Pass keybind if if-cases are not true

vim.keymap.set("i", "<cr>", function()
  local l = vim.api.nvim_get_current_line()
  local _, num_pipes_current_line = string.gsub(l, "|", "")
  local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local next_line = vim.api.nvim_buf_get_lines(0, r - 1, r, false)[1]
  local _, num_pipes_next_line = string.gsub(next_line, "|", "")

  if num_pipes_next_line ~= 0 then
    local pipes = string.rep("|", num_pipes_current_line)
    vim.api.nvim_buf_set_lines(0, r, r, false, { pipes })
    vim.api.nvim_command("TableFormat")
    vim.api.nvim_win_set_cursor(0, { r + 1, 2 })
  else
    vim.api.nvim_feedkeys("\n", "i", false)
  end
end)

-- TODO: Add keybinds for list-handling!

vim.keymap.set("n", "<tab>", function()
  vim.api.nvim_command("TableFormat")
end)
