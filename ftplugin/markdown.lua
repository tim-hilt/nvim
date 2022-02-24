if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
  local function map(...)
    vim.api.nvim_buf_set_keymap(0, ...)
  end
  local opts = { noremap = true, silent = false }
  map("v", "<leader>n", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
end

vim.keymap.set({ "n", "i" }, "<Tab>", function()
  local curr_line = vim.api.nvim_get_current_line()
  local _, num_pipes = curr_line:gsub("|", "")

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

  if start ~= nil and start < curr_line:len() then
    vim.api.nvim_win_set_cursor(0, { r, start + 1 })
  end
end)

vim.keymap.set({ "n", "i" }, "<S-Tab>", function()
  local curr_line = vim.api.nvim_get_current_line()
  local _, num_pipes = curr_line:gsub("|", "")

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
    local x, y = curr_line:find("|", b)
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

local is_bullet_item = function(l)
  return l:match("^%s*-") and not l:match("^%s*- %[ %]") and not l:match("^%s*- %[x%]")
end

local is_todo_item = function(l)
  return l:match("^%s*- %[ %]")
end

local is_checked_todo_item = function(l)
  return l:match("^%s*- %[x%]")
end

local has_timestamp = function(l)
  return l:match("^%s*- %[x%] %[%d%d%d%d%-%d%d%-%d%d% %d%d:%d%d:%d%d%]")
end

local get_timestamp = function(l)
  return l:match("%[%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d%]")
end

local cursor_on_timestamp = function(l, c)
  local st, et = l:find("%[%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d%]")
  return st - 1 <= c and c < et -- Have to catch one char before for whitespace
end

local get_text_after_timestamp = function(l)
  return l:match("%[%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d%] (.*)")
end

local cursor_on_checked_todoitem = function(l, c)
  local s, e = l:find("^%s*- %[x%]")
  return s <= c and c < e
end

local cursor_on_todoitem = function(l, c)
  local s, e = l:find("^%s*- %[ %]")
  return s <= c and c < e
end

vim.keymap.set("i", "<cr>", function()
  local l = vim.api.nvim_get_current_line()
  local _, num_pipes_current_line = l:gsub("|", "")
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  local next_line = vim.api.nvim_buf_get_lines(0, r, r + 1, false)[1]

  local num_pipes_next_line = 0

  if next_line ~= nil then
    _, num_pipes_next_line = next_line:gsub("|", "")
  end

  local leading_whitespace = l:match("^%s*")
  local todo_item_prefix = leading_whitespace .. "- [ ] "
  local before_cursor = l:sub(1, c)
  local after_cursor = l:sub(c + 1)

  local handle_bullet_item = function()
    local bullet_item_prefix = leading_whitespace .. "- "
    if not is_bullet_item(before_cursor) then
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, {
        bullet_item_prefix
      })
      local nl = bullet_item_prefix .. after_cursor:match("^%s*- (.*)")
      vim.api.nvim_buf_set_lines(0, r, r, false, { nl })
    else
      before_cursor = before_cursor:gsub("%s+$", " ")
      after_cursor = after_cursor:gsub("^%s+", "")
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { before_cursor })
      local nl = bullet_item_prefix .. after_cursor
      vim.api.nvim_buf_set_lines(0, r, r, false, { nl })
    end
    vim.api.nvim_win_set_cursor(0, { r + 1, bullet_item_prefix:len() })
  end

  local handle_todo_item = function()
    if cursor_on_todoitem(l, c) then
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, {
        todo_item_prefix
      })
      vim.api.nvim_buf_set_lines(0, r, r, false, {
        todo_item_prefix .. l:match("^%s*- %[ %] (.*)")
      })
    elseif is_todo_item(before_cursor) then
      before_cursor = before_cursor:gsub("%s+$", " ")
      after_cursor = after_cursor:gsub("^%s+", "")
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { before_cursor })
      local nl = todo_item_prefix .. after_cursor
      vim.api.nvim_buf_set_lines(0, r, r, false, { nl })
    else
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, {
        todo_item_prefix
      })
      local nl = todo_item_prefix .. after_cursor:match("^%s*- %[ %] (.*)")
      vim.api.nvim_buf_set_lines(0, r, r, false, { nl })
    end
    vim.api.nvim_win_set_cursor(0, { r + 1, todo_item_prefix:len() })
  end

  local handle_checked_todo_item = function()
    local checked_todo_item_prefix = leading_whitespace .. "- [x] "
    local timestamp = get_timestamp(l)

    if cursor_on_checked_todoitem(l, c) then
      local curr_line = leading_whitespace .. "- [x] " .. timestamp .. " "
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { curr_line })
      local nl = todo_item_prefix .. get_text_after_timestamp(l)
      vim.api.nvim_buf_set_lines(0, r, r, false, { nl })
    elseif cursor_on_timestamp(l, c) then
      local curr_line = leading_whitespace .. checked_todo_item_prefix .. timestamp .. " "
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { curr_line })
      local nl = todo_item_prefix .. get_text_after_timestamp(l)
      vim.api.nvim_buf_set_lines(0, r, r, false, { nl })
    elseif is_checked_todo_item(before_cursor) then
      before_cursor = before_cursor:gsub("%s+$", " ")
      after_cursor = after_cursor:gsub("^%s+", "")
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { before_cursor })
      local nl = todo_item_prefix .. after_cursor
      vim.api.nvim_buf_set_lines(0, r, r, false, { nl })
    else
      local curr_line = leading_whitespace .. "- [x] " .. timestamp
      vim.api.nvim_buf_set_lines(0, r - 1, r, false, { curr_line })
      local nl = todo_item_prefix .. get_text_after_timestamp(l)
      vim.api.nvim_buf_set_lines(0, r, r, false, { nl })
    end
    vim.api.nvim_win_set_cursor(0, { r + 1, todo_item_prefix:len() })
  end

  -- Table stuff
  if num_pipes_current_line > 0 and l:match("[%d%a]") and num_pipes_next_line == 0 then
    local pipes = ("|"):rep(num_pipes_current_line)
    vim.api.nvim_buf_set_lines(0, r, r, false, { pipes })
    vim.api.nvim_command("TableFormat")
    vim.api.nvim_win_set_cursor(0, { r + 1, 2 })
  elseif num_pipes_current_line > 0 and not (l:match("%a") or l:match("%d")) then
    if next_line == nil then
      vim.api.nvim_buf_set_lines(0, r, r + 1, false, { "" })
    end
    vim.api.nvim_win_set_cursor(0, { r + 1, 0 })
    -- TODOlist-stuff
  elseif is_bullet_item(l) then
    handle_bullet_item()
  elseif is_todo_item(l) then
    handle_todo_item()
  elseif is_checked_todo_item(l) then
    handle_checked_todo_item()
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
  elseif is_bullet_item(l) then
    local new_line = l:gsub("-", "- [ ]", 1)
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
    vim.api.nvim_win_set_cursor(0, { r, c + 5 })
  elseif is_todo_item(l) then
    local new_line = l:gsub("- %[ %]", "- [x] [" .. os.date("!%Y-%m-%d %T") .. "]", 1)
    vim.api.nvim_buf_set_lines(0, r - 1, r, false, { new_line })
    vim.api.nvim_win_set_cursor(0, { r, c + 22 })
  elseif is_checked_todo_item(l) then
    if has_timestamp(l) then
      local new_line = l:gsub("- %[x%] %[%d%d%d%d%-%d%d%-%d%d% %d%d:%d%d:%d%d%]", "- [ ]")
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
