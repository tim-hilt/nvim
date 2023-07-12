local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

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
vim.o.bri = true
vim.o.briopt = "min:20,shift:4,sbr,list:2"
vim.o.lbr = true
vim.o.signcolumn = "yes"
vim.o.laststatus = 3
vim.o.mouse = nil
vim.o.undofile = true
vim.o.background = "dark"

vim.diagnostic.config({ virtual_text = false })

-- TODO: Make more modular with plugins-dir

require("lazy").setup({
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
		end,
		dependencies = {
			"hrsh7th/nvim-cmp",
			"folke/neodev.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("lspconfig")["lua_ls"].setup({
				capabilities = capabilities,
			})
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"folke/neodev.nvim",
		opts = {},
	},
	{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup()
			vim.cmd("colorscheme github_dark")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"go",
				"tsx",
				"typescript",
				"javascript",
				"lua",
				"fish",
				"comment",
				"cpp",
			},
			highlight = { enable = true },
		},
		build = ":TSUpdate",
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = { i = { ["<esc>"] = actions.close } },
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
				pickers = {
					find_files = {
						find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
					},
				},
			})
			local extensions = { "fzf" }

			for _, extension in ipairs(extensions) do
				telescope.load_extension(extension)
			end
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"folke/todo-comments.nvim",
		opts = { signs = false },
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"max397574/better-escape.nvim",
		opts = {
			mapping = { "mn" },
			timeout = 200,
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			labels = "arstoien",
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	"vim-scripts/restore_view.vim",
})

vim.api.nvim_exec(
	[[
  set clipboard+=unnamedplus
  filetype plugin indent on
  set noswapfile
  set noshowmode
]],
	true
)

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
  ]])

-- Keymaps
local remap = vim.api.nvim_set_keymap

remap("n", "'", ":wa<CR>", {})

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
