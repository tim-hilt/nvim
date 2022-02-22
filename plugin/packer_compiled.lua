-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
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
    config = { "\27LJ\2\n¸\1\0\0\3\0\5\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\1K\0\1\0+map <silent> e <Plug>CamelCaseMotion_e+map <silent> b <Plug>CamelCaseMotion_b+map <silent> w <Plug>CamelCaseMotion_w\bcmd\bvim\0" },
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
    config = { "\27LJ\2\nÙ\4\0\0\a\0\23\2,6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0B\1\2\0015\1\f\0004\2\3\0009\3\6\0009\3\a\3'\5\b\0'\6\t\0B\3\3\2>\3\1\0029\3\6\0009\3\a\3'\5\n\0'\6\v\0B\3\3\0?\3\0\0=\2\r\0014\2\3\0009\3\6\0009\3\a\3'\5\14\0'\6\15\0B\3\3\0?\3\1\0=\2\16\1=\1\5\0009\1\17\0'\3\16\0005\4\18\0B\1\3\0019\1\17\0'\3\19\0005\4\20\0B\1\3\0019\1\17\0'\3\21\0005\4\22\0B\1\3\1K\0\1\0\1\4\0\0\15javascript\15typescript\20javascriptreact\20typescriptreact\1\3\0\0\15javascript\15typescript\20javascriptreact\1\2\0\0\15javascript\20filetype_extend\15typescript&type $1 = {\n  [key in $2]: $3;\n};\amt\15javascript\1\0\0$const $1 = ($2)$3 => {\n  $4\n}$0\acf+export const $1 = ($2)$3 => {\n  $4\n}$0\becf\18parse_snippet\vparser\rsnippets\1\0\3\fhistory\2\17updateevents\29TextChanged,TextChangedI\24enable_autosnippets\2\15set_config\vconfig\fluasnip\frequire\5€€À™\4\3€€À™\4\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
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
  delimitMate = {
    config = { "\27LJ\2\nb\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0001        let delimitMate_expand_cr = 1\n      \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/delimitMate",
    url = "https://github.com/Raimondi/delimitMate"
  },
  ["file-line"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/file-line",
    url = "https://github.com/bogado/file-line"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nŸ\1\0\0\a\0\b\1\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5€€À™\4(\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\15lua-format\nstdin\2Ø\1\1\0\a\0\14\0\0293\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\f\0005\4\5\0004\5\3\0003\6\4\0>\6\1\5=\5\6\0044\5\3\0>\0\1\5=\5\a\0044\5\3\0>\0\1\5=\5\b\0044\5\3\0>\0\1\5=\5\t\0044\5\3\0>\0\1\5=\5\n\0044\5\3\0>\0\1\5=\5\v\4=\4\r\3B\1\2\1K\0\1\0\rfiletype\1\0\0\20typescriptreact\15typescript\15javascript\thtml\tjson\blua\1\0\0\0\nsetup\14formatter\frequire\0\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["github-nvim-theme"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17github-theme\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\ns\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vlabels\1\0\1\16ignore_case\1\1\v\0\0\6a\6r\6s\6t\6n\6e\6i\6o\6g\6m\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\vgithub\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-cmp"] = {
    after = { "tabout.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n¢\6\0\0\f\1*\0L6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\0\0\0026\1\0\0'\3\a\0B\1\2\0029\2\b\0019\2\t\0025\4\n\0-\5\0\0=\5\v\4=\0\f\0045\5\r\0=\5\14\4B\2\2\0019\2\15\0019\2\t\0025\4\16\0-\5\0\0=\5\v\4=\0\f\0045\5\17\0=\5\14\0045\5\18\0=\5\19\0045\5'\0005\6\25\0005\a\20\0006\b\3\0009\b\21\b6\n\22\0009\n\23\n'\v\24\0B\b\3\2=\b\23\a=\a\26\0065\a\27\0005\b\28\0=\b\29\a=\a\30\0065\a$\0004\b\0\0166\t\3\0009\t\31\t9\t \t'\v!\0B\t\2\2+\n\2\0<\n\t\b6\t\3\0009\t\31\t9\t \t'\v\"\0B\t\2\2+\n\2\0<\n\t\b6\t\3\0009\t\31\t9\t \t'\v#\0B\t\2\2+\n\2\0<\n\t\b=\b%\a=\a&\6=\6(\5=\5)\4B\2\2\1K\0\1\0\1À\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\24$VIMRUNTIME/lua/vim\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\3\0\0\bvim\buse\1\0\1\venable\2\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\bcmd\1\4\0\0!/usr/bin/lua-language-server\a-E*/usr/lib/lua-language-server/main.lua\1\0\1\26debounce_text_changes\3–\1\1\0\0\16sumneko_lua\nflags\1\0\1\26debounce_text_changes\3–\1\17capabilities\14on_attach\1\0\0\nsetup\rtsserver\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nç\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\frainbow\1\0\1\venable\2\fautotag\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\b\0\0\ago\btsx\15typescript\15javascript\blua\tfish\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
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
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¼\3\0\0\v\0\26\0&6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\v\0005\5\t\0005\6\a\0005\a\5\0009\b\4\1=\b\6\a=\a\b\6=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\5=\5\16\0045\5\20\0005\6\18\0005\a\17\0=\a\19\6=\6\21\5=\5\22\4B\2\2\0015\2\23\0006\3\24\0\18\5\2\0B\3\2\4X\6\3€9\b\25\0\18\n\a\0B\b\2\1E\6\3\3R\6ûK\0\1\0\19load_extension\vipairs\1\2\0\0\bfzf\fpickers\15find_files\1\0\0\17find_command\1\0\0\1\5\0\0\afd\v--type\6f\23--strip-cwd-prefix\15extensions\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\22telescope.actions\14telescope\frequire\0" },
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
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\nl\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0;        let g:vim_markdown_folding_disabled = 1\n      \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["zk-nvim"] = {
    config = { "\27LJ\2\nµ\1\0\0\b\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0046\5\0\0'\a\a\0B\5\2\0029\5\b\5=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\blsp\vconfig\1\0\0\14on_attach\19tim.lsp-config\bcmd\1\0\1\tname\azk\1\3\0\0\azk\blsp\1\0\1\vpicker\14telescope\nsetup\azk\frequire\0" },
    loaded = true,
    path = "/home/tim/.local/share/nvim/site/pack/packer/start/zk-nvim",
    url = "https://github.com/mickael-menu/zk-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: CamelCaseMotion
time([[Config for CamelCaseMotion]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\3\0\5\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\1K\0\1\0+map <silent> e <Plug>CamelCaseMotion_e+map <silent> b <Plug>CamelCaseMotion_b+map <silent> w <Plug>CamelCaseMotion_w\bcmd\bvim\0", "config", "CamelCaseMotion")
time([[Config for CamelCaseMotion]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: zk-nvim
time([[Config for zk-nvim]], true)
try_loadstring("\27LJ\2\nµ\1\0\0\b\0\f\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0046\5\0\0'\a\a\0B\5\2\0029\5\b\5=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\blsp\vconfig\1\0\0\14on_attach\19tim.lsp-config\bcmd\1\0\1\tname\azk\1\3\0\0\azk\blsp\1\0\1\vpicker\14telescope\nsetup\azk\frequire\0", "config", "zk-nvim")
time([[Config for zk-nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\nI\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\ns\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vlabels\1\0\1\16ignore_case\1\1\v\0\0\6a\6r\6s\6t\6n\6e\6i\6o\6g\6m\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: delimitMate
time([[Config for delimitMate]], true)
try_loadstring("\27LJ\2\nb\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0001        let delimitMate_expand_cr = 1\n      \14nvim_exec\bapi\bvim\0", "config", "delimitMate")
time([[Config for delimitMate]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nÙ\4\0\0\a\0\23\2,6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0B\1\2\0015\1\f\0004\2\3\0009\3\6\0009\3\a\3'\5\b\0'\6\t\0B\3\3\2>\3\1\0029\3\6\0009\3\a\3'\5\n\0'\6\v\0B\3\3\0?\3\0\0=\2\r\0014\2\3\0009\3\6\0009\3\a\3'\5\14\0'\6\15\0B\3\3\0?\3\1\0=\2\16\1=\1\5\0009\1\17\0'\3\16\0005\4\18\0B\1\3\0019\1\17\0'\3\19\0005\4\20\0B\1\3\0019\1\17\0'\3\21\0005\4\22\0B\1\3\1K\0\1\0\1\4\0\0\15javascript\15typescript\20javascriptreact\20typescriptreact\1\3\0\0\15javascript\15typescript\20javascriptreact\1\2\0\0\15javascript\20filetype_extend\15typescript&type $1 = {\n  [key in $2]: $3;\n};\amt\15javascript\1\0\0$const $1 = ($2)$3 => {\n  $4\n}$0\acf+export const $1 = ($2)$3 => {\n  $4\n}$0\becf\18parse_snippet\vparser\rsnippets\1\0\3\fhistory\2\17updateevents\29TextChanged,TextChangedI\24enable_autosnippets\2\15set_config\vconfig\fluasnip\frequire\5€€À™\4\3€€À™\4\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nŸ\1\0\0\a\0\b\1\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5€€À™\4(\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\bexe\15lua-format\nstdin\2Ø\1\1\0\a\0\14\0\0293\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\f\0005\4\5\0004\5\3\0003\6\4\0>\6\1\5=\5\6\0044\5\3\0>\0\1\5=\5\a\0044\5\3\0>\0\1\5=\5\b\0044\5\3\0>\0\1\5=\5\t\0044\5\3\0>\0\1\5=\5\n\0044\5\3\0>\0\1\5=\5\v\4=\4\r\3B\1\2\1K\0\1\0\rfiletype\1\0\0\20typescriptreact\15typescript\15javascript\thtml\tjson\blua\1\0\0\0\nsetup\14formatter\frequire\0\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\vgithub\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: vim-markdown
time([[Config for vim-markdown]], true)
try_loadstring("\27LJ\2\nl\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\1K\0\1\0;        let g:vim_markdown_folding_disabled = 1\n      \14nvim_exec\bapi\bvim\0", "config", "vim-markdown")
time([[Config for vim-markdown]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nç\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\frainbow\1\0\1\venable\2\fautotag\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\b\0\0\ago\btsx\15typescript\15javascript\blua\tfish\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17github-theme\frequire\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireü\1\0\1\t\2\n\0\31-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\21€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\14€6\1\3\0009\1\4\0019\1\5\0016\3\3\0009\3\6\0039\3\a\3'\5\b\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\t\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\5!<Plug>luasnip-expand-or-jump\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\23expand_or_jumpable\21select_next_item\fvisibleñ\1\0\1\t\2\n\0 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\22€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\14€6\1\3\0009\1\4\0019\1\5\0016\3\3\0009\3\6\0039\3\a\3'\5\b\0+\6\2\0+\a\2\0+\b\2\0B\3\5\2'\4\t\0B\1\3\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\5\28<Plug>luasnip-jump-prev\27nvim_replace_termcodes\bapi\rfeedkeys\afn\bvim\rjumpable\21select_prev_item\fvisible¶\4\1\0\v\0&\0L6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0045\5\f\0009\6\t\0009\b\t\0009\b\n\b)\nüÿB\b\2\0025\t\v\0B\6\3\2=\6\r\0059\6\t\0009\b\t\0009\b\n\b)\n\4\0B\b\2\0025\t\14\0B\6\3\2=\6\15\0059\6\t\0009\b\t\0009\b\16\bB\b\1\0025\t\17\0B\6\3\2=\6\18\0059\6\t\0005\b\20\0009\t\t\0009\t\19\tB\t\1\2=\t\21\b9\t\t\0009\t\22\tB\t\1\2=\t\23\bB\6\2\2=\6\24\0059\6\t\0009\6\25\0065\b\26\0B\6\2\2=\6\27\0059\6\t\0003\b\28\0005\t\29\0B\6\3\2=\6\30\0059\6\t\0003\b\31\0005\t \0B\6\3\2=\6!\5=\5\t\0049\5\"\0009\5#\0054\a\3\0005\b$\0>\b\1\a5\b%\0>\b\2\aB\5\2\2=\5#\4B\2\2\0012\0\0€K\0\1\0\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n¢\6\0\0\f\1*\0L6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\0029\2\6\2B\2\1\0A\0\0\0026\1\0\0'\3\a\0B\1\2\0029\2\b\0019\2\t\0025\4\n\0-\5\0\0=\5\v\4=\0\f\0045\5\r\0=\5\14\4B\2\2\0019\2\15\0019\2\t\0025\4\16\0-\5\0\0=\5\v\4=\0\f\0045\5\17\0=\5\14\0045\5\18\0=\5\19\0045\5'\0005\6\25\0005\a\20\0006\b\3\0009\b\21\b6\n\22\0009\n\23\n'\v\24\0B\b\3\2=\b\23\a=\a\26\0065\a\27\0005\b\28\0=\b\29\a=\a\30\0065\a$\0004\b\0\0166\t\3\0009\t\31\t9\t \t'\v!\0B\t\2\2+\n\2\0<\n\t\b6\t\3\0009\t\31\t9\t \t'\v\"\0B\t\2\2+\n\2\0<\n\t\b6\t\3\0009\t\31\t9\t \t'\v#\0B\t\2\2+\n\2\0<\n\t\b=\b%\a=\a&\6=\6(\5=\5)\4B\2\2\1K\0\1\0\1À\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\24$VIMRUNTIME/lua/vim\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\3\0\0\bvim\buse\1\0\1\venable\2\fruntime\1\0\0\6;\tpath\fpackage\nsplit\1\0\1\fversion\vLuaJIT\bcmd\1\4\0\0!/usr/bin/lua-language-server\a-E*/usr/lib/lua-language-server/main.lua\1\0\1\26debounce_text_changes\3–\1\1\0\0\16sumneko_lua\nflags\1\0\1\26debounce_text_changes\3–\1\17capabilities\14on_attach\1\0\0\nsetup\rtsserver\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd telescope-fzf-native.nvim ]]
vim.cmd [[ packadd telescope.nvim ]]

-- Config for: telescope.nvim
try_loadstring("\27LJ\2\n¼\3\0\0\v\0\26\0&6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\v\0005\5\t\0005\6\a\0005\a\5\0009\b\4\1=\b\6\a=\a\b\6=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\5=\5\16\0045\5\20\0005\6\18\0005\a\17\0=\a\19\6=\6\21\5=\5\22\4B\2\2\0015\2\23\0006\3\24\0\18\5\2\0B\3\2\4X\6\3€9\b\25\0\18\n\a\0B\b\2\1E\6\3\3R\6ûK\0\1\0\19load_extension\vipairs\1\2\0\0\bfzf\fpickers\15find_files\1\0\0\17find_command\1\0\0\1\5\0\0\afd\v--type\6f\23--strip-cwd-prefix\15extensions\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")

vim.cmd [[ packadd tabout.nvim ]]

-- Config for: tabout.nvim
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vtabout\frequire\0", "config", "tabout.nvim")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
