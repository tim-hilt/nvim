local isCheckedTodoItem = function(l)
  return l:match("^%s*- %[x%]")
end

local hasTimestamp = function(l)
  return l:match("^%s*- %[x%] %[%d%d%d%d%-%d%d%-%d%d% %d%d:%d%d:%d%d%]")
end

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
    local r, c = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { "  " .. curr_line })
    vim.api.nvim_win_set_cursor(0, { r, c + 2 })
    return
  else
    vim.api.nvim_command("TableFormat")
  end

  curr_line = vim.api.nvim_get_current_line() -- Have to call again, because line has changed
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  local start = curr_line:find("|", c + 1)

  if start ~= nil and start < string.len(curr_line) then
    vim.api.nvim_win_set_cursor(0, { r, start + 1 })
  end
end)

vim.keymap.set({ "n", "i" }, "<S-Tab>", function()
  local curr_line = vim.api.nvim_get_current_line()
  local _, num_pipes = string.gsub(curr_line, "|", "")

  if num_pipes < 3 and curr_line:match("^  ") then
    local r, c = unpack(vim.api.nvim_win_get_cursor(0))
    local after_spaces = curr_line:match("^  (.*)")
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { after_spaces })
    vim.api.nvim_win_set_cursor(0, { r, c - 2 })
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

local isBulletItem = function(l)
  return l:match("^%s*-") and not l:match("^%s*- %[ %]") and
             not l:match("^%s*- %[x%]")
end

local isTodoItem = function(l)
  return l:match("^%s*- %[ %]")
end

vim.keymap.set("i", "<cr>", function()
  local l = vim.api.nvim_get_current_line()
  local _, num_pipes_current_line = string.gsub(l, "|", "")
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  local next_line = vim.api.nvim_buf_get_lines(0, r, r + 1, false)[1]

  local num_pipes_next_line = 0

  if next_line ~= nil then
    _, num_pipes_next_line = string.gsub(next_line, "|", "")
  end

  if num_pipes_current_line > 0 and l:match("[%d%a]") and num_pipes_next_line ==
      0 then
    local pipes = string.rep("|", num_pipes_current_line)
    vim.api.nvim_buf_set_lines(0, r, r, false, { pipes })
    vim.api.nvim_command("TableFormat")
    vim.api.nvim_win_set_cursor(0, { r + 1, 2 })
  elseif num_pipes_current_line > 0 and not (l:match("%a") or l:match("%d")) then
    if next_line == nil then
      vim.api.nvim_buf_set_lines(0, r, r + 1, false, { "" })
    end
    vim.api.nvim_win_set_cursor(0, { r + 1, 0 })
  elseif isBulletItem(l) and not isTodoItem(l) then
    local leading_whitespace = l:match("^%s*")
    local before_cursor = l:sub(1, c)
    local after_cursor = l:sub(c + 1)
    local bullet_item_prefix = leading_whitespace .. "- "
    if not isBulletItem(before_cursor) then
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, {
        bullet_item_prefix
      })
      vim.api.nvim_buf_set_lines(0, r, r, false, {
        bullet_item_prefix .. after_cursor:match("^%s*- (.*)")
      })
    else
      before_cursor = before_cursor:match("^%s*- ") or before_cursor .. " "
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { before_cursor })
      vim.api.nvim_buf_set_lines(0, r, r, false,
                                 { bullet_item_prefix .. after_cursor })
    end
    vim.api.nvim_win_set_cursor(0, { r + 1, bullet_item_prefix:len() })
  elseif isTodoItem(l) or isCheckedTodoItem(l) then
    local leading_whitespace = l:match("^%s*")
    local before_cursor = l:sub(1, c)
    local after_cursor = l:sub(c + 1)
    local todo_item_prefix = leading_whitespace .. "- [ ] "
    local s, e = l:find("^%s*- %[ %]")
    local cursor_on_todoitem = s <= c and c < e

    if cursor_on_todoitem then
      vim.api.nvim_buf_set_lines(0, r - 1, r, false,
                                 { leading_whitespace .. "- [ ] " })
      vim.api.nvim_buf_set_lines(0, r, r, false, {
        todo_item_prefix .. l:match("^%s*- %[ %] (.*)")
      })
      -- Do sth
    elseif isTodoItem(before_cursor) or isCheckedTodoItem(before_cursor) then
      if not before_cursor:match("^%s*- %[ %] ") then
        before_cursor = before_cursor .. " "
      end
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { before_cursor })
      vim.api.nvim_buf_set_lines(0, r, r, false,
                                 { todo_item_prefix .. after_cursor })
    else
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, {
        todo_item_prefix
      })
      vim.api.nvim_buf_set_lines(0, r, r, false, {
        todo_item_prefix .. after_cursor:match("^%s*- %[ %] (.*)")
      })
    end
    vim.api.nvim_win_set_cursor(0, { r + 1, todo_item_prefix:len() })

  else
    vim.api.nvim_feedkeys("\n", "i", false)
  end
end)

-- TODO: Move down when completed
vim.keymap.set({ "i", "n" }, "<C-CR>", function()
  local l = vim.api.nvim_get_current_line()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))

  if l:len() == 0 or l:match("^%s*$") then
    return
  elseif not l:match("^%s*-") then
    local leading_whitespace = l:match("^%s*")
    local after_whitespace = l:match("^%s*(.*)")
    local new_line = leading_whitespace .. "- " .. after_whitespace
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
    vim.api.nvim_win_set_cursor(0, { r, c + 2 })
  elseif isBulletItem(l) then
    local new_line = l:gsub("-", "- [ ]", 1)
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
    vim.api.nvim_win_set_cursor(0, { r, c + 5 })
  elseif isTodoItem(l) then
    local new_line = l:gsub("- %[ %]",
                            "- [x] [" .. os.date("!%Y-%m-%d %T") .. "]", 1)
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
    vim.api.nvim_win_set_cursor(0, { r, c + 22 })
  elseif isCheckedTodoItem(l) then
    if hasTimestamp(l) then
      local new_line = l:gsub(
                           "- %[x%] %[%d%d%d%d%-%d%d%-%d%d% %d%d:%d%d:%d%d%]",
                           "- [ ]")
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
      -- TODO: Figure out a good way to preserve cursor-position:
      --       - If cusor is after timestamp, set cursor to the position in current word
      --         (idea: Count chars after timestamp and calculate position from that)
      --       - If cursor is inside of timestamp, set cursor after empty checkbox
      --       - If cursor is before timestamp, don't modify it
    else
      local new_line = l:gsub("- %[x%]", "- [ ]")
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
    end
  end
end)
