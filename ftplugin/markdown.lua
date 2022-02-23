if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
  local function map(...)
    vim.api.nvim_buf_set_keymap(0, ...)
  end
  local opts = { noremap = true, silent = false }
  map("v", "<leader>n",
      ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
end

vim.keymap.set({ "n", "i" }, "<Tab>", function()
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

-- TODO: If current line has a checkboxitem, repeat item on next line
vim.keymap.set("i", "<cr>", function()
  local l = vim.api.nvim_get_current_line()
  local _, num_pipes_current_line = string.gsub(l, "|", "")
  local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local next_line = vim.api.nvim_buf_get_lines(0, r, r + 1, false)[1]

  if next_line == nil then
    vim.api.nvim_feedkeys("\n", "i", false)
    return
  end

  local _, num_pipes_next_line = string.gsub(next_line, "|", "")

  if num_pipes_current_line > 0 and l:match("[%d%a]") and num_pipes_next_line ==
      0 then
    local pipes = string.rep("|", num_pipes_current_line)
    vim.api.nvim_buf_set_lines(0, r, r, false, { pipes })
    vim.api.nvim_command("TableFormat")
    vim.api.nvim_win_set_cursor(0, { r + 1, 2 })
  elseif num_pipes_current_line > 0 and not (l:match("%a") or l:match("%d")) then
    vim.api.nvim_win_set_cursor(0, { r + 1, 0 })
  else
    vim.api.nvim_feedkeys("\n", "i", false)
  end
end)

local isBulletItem = function(l)
  return l:match("^%s*- ") and not l:match("^%s*- %[ %]") and
             not l:match("^%s*- %[x%]")
end

local isTodoItem = function(l)
  return l:match("^%s*- %[ %]")
end

local isCheckedTodoItem = function(l)
  return l:match("^%s*- %[x%]")
end

local hasTimestamp = function(l)
  return l:match("^%s*- %[x%] %[%d%d%d%d%-%d%d%-%d%d% %d%d:%d%d:%d%d%]")
end

-- TODO: Move down when completed
vim.keymap.set({ "i", "n" }, "<C-CR>", function()
  local l = vim.api.nvim_get_current_line()
  local r, _ = unpack(vim.api.nvim_win_get_cursor(0))

  -- print(os.date("!%Y-%m-%d %T"))
  if l:len() == 0 or l:match("^%s*$") then
    return
  elseif not l:match("^%s*-") then
    local leading_whitespace = l:match("^%s*")
    local after_whitespace = l:match("^%s*(.*)")
    local new_line = leading_whitespace .. "- " .. after_whitespace
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
  elseif isBulletItem(l) then
    local new_line = l:gsub("-", "- [ ]", 1)
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
  elseif isTodoItem(l) then
    local new_line = l:gsub("- %[ %]",
                            "- [x] [" .. os.date("!%Y-%m-%d %T") .. "]", 1)
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
  elseif isCheckedTodoItem(l) then
    local new_line = ""
    if hasTimestamp(l) then
      new_line = l:gsub("- %[x%] %[%d%d%d%d%-%d%d%-%d%d% %d%d:%d%d:%d%d%]",
                        "- [ ]")
    else
      new_line = l:gsub("- %[x%]", "- [ ]")
    end
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
  end
end)
