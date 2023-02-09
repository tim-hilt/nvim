-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  CamelCaseMotion = {
    config = { "\27LJ\2\n∏\1\0\0\3\0\5\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\1K\0\1\0+map <silent> e <Plug>CamelCaseMotion_e+map <silent> b <Plug>CamelCaseMotion_b+map <silent> w <Plug>CamelCaseMotion_w\bcmd\bvim\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nŸ\4\0\0\a\0\23\2,6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0B\1\2\0015\1\f\0004\2\3\0009\3\6\0009\3\a\3'\5\b\0'\6\t\0B\3\3\2>\3\1\0029\3\6\0009\3\a\3'\5\n\0'\6\v\0B\3\3\0?\3\0\0=\2\r\0014\2\3\0009\3\6\0009\3\a\3'\5\14\0'\6\15\0B\3\3\0?\3\1\0=\2\16\1=\1\5\0009\1\17\0'\3\16\0005\4\18\0B\1\3\0019\1\17\0'\3\19\0005\4\20\0B\1\3\0019\1\17\0'\3\21\0005\4\22\0B\1\3\1K\0\1\0\1\4\0\0\15javascript\15typescript\20javascriptreact\20typescriptreact\1\3\0\0\15javascript\15typescript\20javascriptreact\1\2\0\0\15javascript\20filetype_extend\15typescript&type $1 = {\n  [key in $2]: $3;\n};\amt\15javascript\1\0\0$const $1 = ($2)$3 => {\n  $4\n}$0\acf+export const $1 = ($2)$3 => {\n  $4\n}$0\becf\18parse_snippet\vparser\rsnippets\1\0\3\24enable_autosnippets\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\fluasnip\frequire\5ÄÄ¿ô\4\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fmapping\1\0\1\ftimeout\3»\1\1\2\0\0\amn\nsetup\18better_escape\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["file-line"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/file-line",
    url = "https://github.com/bogado/file-line"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\5\0\a6\0\0\0'\2\1\0B\0\2\0015\0\2\0005\1\3\0=\1\4\0L\0\2\0\targs\1\2\0\0\bfmt\1\0\1\bexe\14terraform\16format ran!\nprint‘\4\1\0\b\0\26\0@6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\25\0005\3\5\0004\4\3\0006\5\0\0'\a\3\0B\5\2\0029\5\4\5>\5\1\4=\4\6\0034\4\3\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5>\5\1\4=\4\t\0034\4\3\0006\5\0\0'\a\n\0B\5\2\0029\5\b\5>\5\1\4=\4\v\0034\4\3\0006\5\0\0'\a\f\0B\5\2\0029\5\b\5>\5\1\4=\4\r\0034\4\3\0006\5\0\0'\a\14\0B\5\2\0029\5\b\5>\5\1\4=\4\15\0034\4\3\0006\5\0\0'\a\16\0B\5\2\0029\5\b\5>\5\1\4=\4\17\0034\4\3\0006\5\0\0'\a\18\0B\5\2\0029\5\19\5>\5\1\4=\4\20\0035\4\22\0004\5\3\0003\6\21\0>\6\1\5=\5\23\4=\4\24\3=\3\24\2B\0\2\1K\0\1\0\1\0\0\rfiletype\14terraform\1\0\0\0\bcpp\16clangformat\28formatter.filetypes.cpp\20typescriptreact(formatter.filetypes.typescriptreact\15typescript#formatter.filetypes.typescript\15javascript#formatter.filetypes.javascript\thtml\29formatter.filetypes.html\tjson\rprettier\29formatter.filetypes.json\blua\1\0\0\vstylua\28formatter.filetypes.lua\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rgoimport\14go.format\frequire€\3\1\0\b\0\27\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\0\0\0026\1\0\0'\3\a\0B\1\2\0029\1\b\0015\3\15\0005\4\v\0006\5\0\0'\a\t\0B\5\2\0029\5\n\5=\5\n\4=\0\f\0045\5\r\0=\5\14\4=\4\16\3B\1\2\1'\1\17\0006\2\3\0009\2\18\0029\2\19\2\18\4\1\0005\5\20\0B\2\3\0016\2\3\0009\2\18\0029\2\21\0025\4\22\0005\5\23\0003\6\24\0=\6\25\5=\1\26\5B\2\3\1K\0\1\0\ngroup\rcallback\0\1\0\1\fpattern\t*.go\1\2\0\0\16BufWritePre\24nvim_create_autocmd\1\0\1\nclear\2\24nvim_create_augroup\bapi\19format_on_save\flsp_cfg\1\0\0\nflags\1\0\1\26debounce_text_changes\3ñ\1\17capabilities\1\0\0\14on_attach\19tim.lsp-config\nsetup\ago\29make_client_capabilities\rprotocol\blsp\bvim\25default_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\nU\0\0\4\0\4\0\n6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\1K\0\1\0\nsetup\fgruvbox\20gruvbox.palette\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n(\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\0¿\15hint_char2(\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\0¿\15hint_char2ù\1\1\0\6\0\f\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0003\5\t\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\n\0'\4\b\0003\5\v\0B\1\4\0012\0\0ÄK\0\1\0\0\6v\0\6s\6n\bset\vkeymap\bvim\1\0\1\tkeys\17tnseriaodhvk\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["list-text-object"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tim/.local/share/nvim/site/pack/packer/opt/list-text-object",
    url = "https://github.com/jesseschalken/list-text-object"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nk\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\2\ntheme\fgruvbox\17globalstatus\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    after = { "nvim-cmp" },
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "tabout.nvim" },
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire¸\1\0\1\t\2\n\0\31-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\21Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\14Ä6\1\3\0009\1\4\0019\1\5\0016\3\3\0009\3\6\0039\3\a\3'\5\b\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\t\0B\1\3\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\2¿\5!<Plug>luasnip-expand-or-jump\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\23expand_or_jumpable\21select_next_item\fvisibleÒ\1\0\1\t\2\n\0 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\22Ä-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\14Ä6\1\3\0009\1\4\0019\1\5\0016\3\3\0009\3\6\0039\3\a\3'\5\b\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\t\0B\1\3\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\2¿\5\28<Plug>luasnip-jump-prev\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\rjumpable\21select_prev_item\fvisible¬\5\1\0\f\0.\0Y6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\r\0009\a\n\0009\t\n\0009\t\v\t)\v¸ˇB\t\2\0025\n\f\0B\a\3\2=\a\14\0069\a\n\0009\t\n\0009\t\v\t)\v\4\0B\t\2\0025\n\15\0B\a\3\2=\a\16\0069\a\n\0009\t\n\0009\t\17\tB\t\1\0025\n\18\0B\a\3\2=\a\19\0069\a\n\0005\t\21\0009\n\n\0009\n\20\nB\n\1\2=\n\22\t9\n\n\0009\n\23\nB\n\1\2=\n\24\tB\a\2\2=\a\25\0069\a\n\0009\a\26\a5\t\27\0B\a\2\2=\a\28\0069\a\n\0003\t\29\0005\n\30\0B\a\3\2=\a\31\0069\a\n\0003\t \0005\n!\0B\a\3\2=\a\"\6=\6\n\0059\6#\0009\6$\0064\b\3\0005\t%\0>\t\1\b5\t&\0>\t\2\bB\6\2\2=\6$\5B\3\2\0019\3'\0\18\5\3\0009\3(\3'\6)\0009\a*\0015\t,\0005\n+\0=\n-\tB\a\2\0A\3\2\0012\0\0ÄK\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\"nvim-autopairs.completion.cmp\bcmp\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tim/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-cursorline"] = {
    config = { "\27LJ\2\n¶\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\15cursorword\ahl\1\0\1\14underline\2\1\0\2\15min_length\3\3\venable\2\15cursorline\1\0\0\1\0\1\venable\1\nsetup\20nvim-cursorline\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nç\a\0\0\f\1.\0W6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\0\0\0026\1\0\0'\3\a\0B\1\2\0029\2\b\0019\2\t\0025\4\n\0-\5\0\0=\5\v\4=\0\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\4B\2\2\0019\2\17\0019\2\t\0025\4\18\0-\5\0\0=\5\v\4=\0\f\0045\5\19\0=\5\14\4B\2\2\0019\2\20\0019\2\t\0025\4\21\0-\5\0\0=\5\v\4=\0\f\0045\5\22\0=\5\14\0045\5\23\0=\5\16\0045\5+\0005\6\29\0005\a\24\0006\b\3\0009\b\25\b6\n\26\0009\n\27\n'\v\28\0B\b\3\2=\b\27\a=\a\30\0065\a\31\0005\b \0=\b!\a=\a\"\0065\a(\0004\b\0\0166\t\3\0009\t#\t9\t$\t'\v%\0B\t\2\2+\n\2\0<\n\t\b6\t\3\0009\t#\t9\t$\t'\v&\0B\t\2\2+\n\2\0<\n\t\b6\t\3\0009\t#\t9\t$\t'\v'\0B\t\2\2+\n\2\0<\n\t\b=\b)\a=\a*\6=\6,\5=\5-\4B\2\2\1K\0\1\0\1¿\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\24$VIMRUNTIME/lua/vim\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\3\0\0\bvim\buse\1\0\1\venable\2\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\1\4\0\0!/usr/bin/lua-language-server\a-E*/usr/lib/lua-language-server/main.lua\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\16sumneko_lua\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\rtsserver\bcmd\1\3\0\0\vclangd\17--clang-tidy\nflags\1\0\1\26debounce_text_changes\3ñ\1\17capabilities\14on_attach\1\0\0\nsetup\vclangd\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\25default_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¯\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\frainbow\1\0\1\venable\2\fautotag\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\n\0\0\ago\btsx\15typescript\15javascript\blua\tfish\fcomment\bcpp\14terraform\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tim/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rainbow_parentheses.vim"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/rainbow_parentheses.vim",
    url = "https://github.com/junegunn/rainbow_parentheses.vim"
  },
  ["restore_view.vim"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/restore_view.vim",
    url = "https://github.com/vim-scripts/restore_view.vim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vtabout\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/tim/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }
  },
  tabular = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÑ\4\0\0\v\0\28\0(6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\r\0005\5\t\0005\6\a\0005\a\5\0009\b\4\1=\b\6\a=\a\b\6=\6\n\0055\6\v\0=\6\f\5=\5\14\0045\5\16\0005\6\15\0=\6\17\5=\5\18\0045\5\22\0005\6\20\0005\a\19\0=\a\21\6=\6\23\5=\5\24\4B\2\2\0015\2\25\0006\3\26\0\18\5\2\0B\3\2\4X\6\3Ä9\b\27\0\18\n\a\0B\b\2\1E\6\3\3R\6˚\127K\0\1\0\19load_extension\vipairs\1\2\0\0\bfzf\fpickers\15find_files\1\0\0\17find_command\1\0\0\1\5\0\0\afd\v--type\6f\23--strip-cwd-prefix\15extensions\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\rdefaults\1\0\0\18layout_config\1\0\1\20prompt_position\btop\rmappings\1\0\1\21sorting_strategy\14ascending\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\22telescope.actions\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nI\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17open_mapping\n<c-t>\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\n†\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0o        let g:vim_markdown_folding_disabled = 1\n        let g:vim_markdown_new_list_item_indent = 0\n      \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0¿\vtoggle±\1\1\0\6\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3B\1\2\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0003\5\r\0B\1\4\0012\0\0ÄK\0\1\0\0\14<leader>z\6n\bset\vkeymap\bvim\vwindow\1\0\0\foptions\1\0\1\vnumber\1\1\0\1\rbackdrop\3\1\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\nI\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nk\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\2\ntheme\fgruvbox\17globalstatus\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17open_mapping\n<c-t>\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\5\0\a6\0\0\0'\2\1\0B\0\2\0015\0\2\0005\1\3\0=\1\4\0L\0\2\0\targs\1\2\0\0\bfmt\1\0\1\bexe\14terraform\16format ran!\nprint‘\4\1\0\b\0\26\0@6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\25\0005\3\5\0004\4\3\0006\5\0\0'\a\3\0B\5\2\0029\5\4\5>\5\1\4=\4\6\0034\4\3\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5>\5\1\4=\4\t\0034\4\3\0006\5\0\0'\a\n\0B\5\2\0029\5\b\5>\5\1\4=\4\v\0034\4\3\0006\5\0\0'\a\f\0B\5\2\0029\5\b\5>\5\1\4=\4\r\0034\4\3\0006\5\0\0'\a\14\0B\5\2\0029\5\b\5>\5\1\4=\4\15\0034\4\3\0006\5\0\0'\a\16\0B\5\2\0029\5\b\5>\5\1\4=\4\17\0034\4\3\0006\5\0\0'\a\18\0B\5\2\0029\5\19\5>\5\1\4=\4\20\0035\4\22\0004\5\3\0003\6\21\0>\6\1\5=\5\23\4=\4\24\3=\3\24\2B\0\2\1K\0\1\0\1\0\0\rfiletype\14terraform\1\0\0\0\bcpp\16clangformat\28formatter.filetypes.cpp\20typescriptreact(formatter.filetypes.typescriptreact\15typescript#formatter.filetypes.typescript\15javascript#formatter.filetypes.javascript\thtml\29formatter.filetypes.html\tjson\rprettier\29formatter.filetypes.json\blua\1\0\0\vstylua\28formatter.filetypes.lua\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: vim-markdown
time([[Config for vim-markdown]], true)
try_loadstring("\27LJ\2\n†\1\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0o        let g:vim_markdown_folding_disabled = 1\n        let g:vim_markdown_new_list_item_indent = 0\n      \14nvim_exec\bapi\bvim\0", "config", "vim-markdown")
time([[Config for vim-markdown]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
try_loadstring("\27LJ\2\n¶\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\15cursorword\ahl\1\0\1\14underline\2\1\0\2\15min_length\3\3\venable\2\15cursorline\1\0\0\1\0\1\venable\1\nsetup\20nvim-cursorline\frequire\0", "config", "nvim-cursorline")
time([[Config for nvim-cursorline]], false)
-- Config for: CamelCaseMotion
time([[Config for CamelCaseMotion]], true)
try_loadstring("\27LJ\2\n∏\1\0\0\3\0\5\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\1K\0\1\0+map <silent> e <Plug>CamelCaseMotion_e+map <silent> b <Plug>CamelCaseMotion_b+map <silent> w <Plug>CamelCaseMotion_w\bcmd\bvim\0", "config", "CamelCaseMotion")
time([[Config for CamelCaseMotion]], false)
-- Config for: go.nvim
time([[Config for go.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rgoimport\14go.format\frequire€\3\1\0\b\0\27\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\0\0\0026\1\0\0'\3\a\0B\1\2\0029\1\b\0015\3\15\0005\4\v\0006\5\0\0'\a\t\0B\5\2\0029\5\n\5=\5\n\4=\0\f\0045\5\r\0=\5\14\4=\4\16\3B\1\2\1'\1\17\0006\2\3\0009\2\18\0029\2\19\2\18\4\1\0005\5\20\0B\2\3\0016\2\3\0009\2\18\0029\2\21\0025\4\22\0005\5\23\0003\6\24\0=\6\25\5=\1\26\5B\2\3\1K\0\1\0\ngroup\rcallback\0\1\0\1\fpattern\t*.go\1\2\0\0\16BufWritePre\24nvim_create_autocmd\1\0\1\nclear\2\24nvim_create_augroup\bapi\19format_on_save\flsp_cfg\1\0\0\nflags\1\0\1\26debounce_text_changes\3ñ\1\17capabilities\1\0\0\14on_attach\19tim.lsp-config\nsetup\ago\29make_client_capabilities\rprotocol\blsp\bvim\25default_capabilities\17cmp_nvim_lsp\frequire\0", "config", "go.nvim")
time([[Config for go.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nç\a\0\0\f\1.\0W6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\0\0\0026\1\0\0'\3\a\0B\1\2\0029\2\b\0019\2\t\0025\4\n\0-\5\0\0=\5\v\4=\0\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\4B\2\2\0019\2\17\0019\2\t\0025\4\18\0-\5\0\0=\5\v\4=\0\f\0045\5\19\0=\5\14\4B\2\2\0019\2\20\0019\2\t\0025\4\21\0-\5\0\0=\5\v\4=\0\f\0045\5\22\0=\5\14\0045\5\23\0=\5\16\0045\5+\0005\6\29\0005\a\24\0006\b\3\0009\b\25\b6\n\26\0009\n\27\n'\v\28\0B\b\3\2=\b\27\a=\a\30\0065\a\31\0005\b \0=\b!\a=\a\"\0065\a(\0004\b\0\0166\t\3\0009\t#\t9\t$\t'\v%\0B\t\2\2+\n\2\0<\n\t\b6\t\3\0009\t#\t9\t$\t'\v&\0B\t\2\2+\n\2\0<\n\t\b6\t\3\0009\t#\t9\t$\t'\v'\0B\t\2\2+\n\2\0<\n\t\b=\b)\a=\a*\6=\6,\5=\5-\4B\2\2\1K\0\1\0\1¿\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\24$VIMRUNTIME/lua/vim\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\3\0\0\bvim\buse\1\0\1\venable\2\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\1\4\0\0!/usr/bin/lua-language-server\a-E*/usr/lib/lua-language-server/main.lua\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\16sumneko_lua\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\rtsserver\bcmd\1\3\0\0\vclangd\17--clang-tidy\nflags\1\0\1\26debounce_text_changes\3ñ\1\17capabilities\14on_attach\1\0\0\nsetup\vclangd\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\25default_capabilities\17cmp_nvim_lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nŸ\4\0\0\a\0\23\2,6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0B\1\2\0015\1\f\0004\2\3\0009\3\6\0009\3\a\3'\5\b\0'\6\t\0B\3\3\2>\3\1\0029\3\6\0009\3\a\3'\5\n\0'\6\v\0B\3\3\0?\3\0\0=\2\r\0014\2\3\0009\3\6\0009\3\a\3'\5\14\0'\6\15\0B\3\3\0?\3\1\0=\2\16\1=\1\5\0009\1\17\0'\3\16\0005\4\18\0B\1\3\0019\1\17\0'\3\19\0005\4\20\0B\1\3\0019\1\17\0'\3\21\0005\4\22\0B\1\3\1K\0\1\0\1\4\0\0\15javascript\15typescript\20javascriptreact\20typescriptreact\1\3\0\0\15javascript\15typescript\20javascriptreact\1\2\0\0\15javascript\20filetype_extend\15typescript&type $1 = {\n  [key in $2]: $3;\n};\amt\15javascript\1\0\0$const $1 = ($2)$3 => {\n  $4\n}$0\acf+export const $1 = ($2)$3 => {\n  $4\n}$0\becf\18parse_snippet\vparser\rsnippets\1\0\3\24enable_autosnippets\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\fluasnip\frequire\5ÄÄ¿ô\4\3ÄÄ¿ô\4\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n(\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\0¿\15hint_char2(\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\0¿\15hint_char2ù\1\1\0\6\0\f\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0003\5\t\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\n\0'\4\b\0003\5\v\0B\1\4\0012\0\0ÄK\0\1\0\0\6v\0\6s\6n\bset\vkeymap\bvim\1\0\1\tkeys\17tnseriaodhvk\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fmapping\1\0\1\ftimeout\3»\1\1\2\0\0\amn\nsetup\18better_escape\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\31show_current_context_start\2\25show_current_context\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¯\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\frainbow\1\0\1\venable\2\fautotag\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\n\0\0\ago\btsx\15typescript\15javascript\blua\tfish\fcomment\bcpp\14terraform\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n \0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0¿\vtoggle±\1\1\0\6\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3B\1\2\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0003\5\r\0B\1\4\0012\0\0ÄK\0\1\0\0\14<leader>z\6n\bset\vkeymap\bvim\vwindow\1\0\0\foptions\1\0\1\vnumber\1\1\0\1\rbackdrop\3\1\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\nU\0\0\4\0\4\0\n6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\1K\0\1\0\nsetup\fgruvbox\20gruvbox.palette\frequire\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd targets.vim ]]
vim.cmd [[ packadd list-text-object ]]
vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire¸\1\0\1\t\2\n\0\31-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\21Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\14Ä6\1\3\0009\1\4\0019\1\5\0016\3\3\0009\3\6\0039\3\a\3'\5\b\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\t\0B\1\3\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\2¿\5!<Plug>luasnip-expand-or-jump\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\23expand_or_jumpable\21select_next_item\fvisibleÒ\1\0\1\t\2\n\0 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\22Ä-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\14Ä6\1\3\0009\1\4\0019\1\5\0016\3\3\0009\3\6\0039\3\a\3'\5\b\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\t\0B\1\3\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\2¿\5\28<Plug>luasnip-jump-prev\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\rjumpable\21select_prev_item\fvisible¬\5\1\0\f\0.\0Y6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\r\0009\a\n\0009\t\n\0009\t\v\t)\v¸ˇB\t\2\0025\n\f\0B\a\3\2=\a\14\0069\a\n\0009\t\n\0009\t\v\t)\v\4\0B\t\2\0025\n\15\0B\a\3\2=\a\16\0069\a\n\0009\t\n\0009\t\17\tB\t\1\0025\n\18\0B\a\3\2=\a\19\0069\a\n\0005\t\21\0009\n\n\0009\n\20\nB\n\1\2=\n\22\t9\n\n\0009\n\23\nB\n\1\2=\n\24\tB\a\2\2=\a\25\0069\a\n\0009\a\26\a5\t\27\0B\a\2\2=\a\28\0069\a\n\0003\t\29\0005\n\30\0B\a\3\2=\a\31\0069\a\n\0003\t \0005\n!\0B\a\3\2=\a\"\6=\6\n\0059\6#\0009\6$\0064\b\3\0005\t%\0>\t\1\b5\t&\0>\t\2\bB\6\2\2=\6$\5B\3\2\0019\3'\0\18\5\3\0009\3(\3'\6)\0009\a*\0015\t,\0005\n+\0=\n-\tB\a\2\0A\3\2\0012\0\0ÄK\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\"nvim-autopairs.completion.cmp\bcmp\frequire\0", "config", "nvim-cmp")

vim.cmd [[ packadd tabout.nvim ]]

-- Config for: tabout.nvim
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vtabout\frequire\0", "config", "tabout.nvim")

vim.cmd [[ packadd telescope-fzf-native.nvim ]]
vim.cmd [[ packadd telescope.nvim ]]

-- Config for: telescope.nvim
try_loadstring("\27LJ\2\nÑ\4\0\0\v\0\28\0(6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\r\0005\5\t\0005\6\a\0005\a\5\0009\b\4\1=\b\6\a=\a\b\6=\6\n\0055\6\v\0=\6\f\5=\5\14\0045\5\16\0005\6\15\0=\6\17\5=\5\18\0045\5\22\0005\6\20\0005\a\19\0=\a\21\6=\6\23\5=\5\24\4B\2\2\0015\2\25\0006\3\26\0\18\5\2\0B\3\2\4X\6\3Ä9\b\27\0\18\n\a\0B\b\2\1E\6\3\3R\6˚\127K\0\1\0\19load_extension\vipairs\1\2\0\0\bfzf\fpickers\15find_files\1\0\0\17find_command\1\0\0\1\5\0\0\afd\v--type\6f\23--strip-cwd-prefix\15extensions\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\rdefaults\1\0\0\18layout_config\1\0\1\20prompt_position\btop\rmappings\1\0\1\21sorting_strategy\14ascending\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
