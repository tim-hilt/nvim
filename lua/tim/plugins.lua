return require("packer").startup(function()
	use({ "wbthomason/packer.nvim" })
	use({
		"nvim-treesitter/nvim-treesitter",
		config = require("tim.treesitter-config").config,
		run = ":TSUpdate",
		requires = {
			{ "windwp/nvim-ts-autotag" },
			{ "p00f/nvim-ts-rainbow" },
		},
	})
	use({
		"bkad/CamelCaseMotion",
		config = function()
			vim.cmd("map <silent> w <Plug>CamelCaseMotion_w")
			vim.cmd("map <silent> b <Plug>CamelCaseMotion_b")
			vim.cmd("map <silent> e <Plug>CamelCaseMotion_e")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup()
		end,
		wants = { "nvim-treesitter" },
		after = { "nvim-cmp" },
	})
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					lua = { require("formatter.filetypes.lua").stylua },
					json = { require("formatter.filetypes.json").prettier },
					html = { require("formatter.filetypes.html").prettier },
					javascript = { require("formatter.filetypes.javascript").prettier },
					typescript = { require("formatter.filetypes.typescript").prettier },
					typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
					cpp = { require("formatter.filetypes.cpp").clangformat },
					terraform = {
						function()
							return {
								exe = "terraform",
								args = {
									"fmt",
								},
							}
						end,
					},
				},
			})
		end,
	})
	use({
		"neovim/nvim-lspconfig",
		config = require("tim.lsp-config").config,
		requires = { { "hrsh7th/nvim-cmp" } },
	})
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			local ls = require("luasnip")
			ls.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})
			ls.snippets = {
				javascript = {
					ls.parser.parse_snippet("ecf", "export const $1 = ($2)$3 => {\n  $4\n}$0"),
					ls.parser.parse_snippet("cf", "const $1 = ($2)$3 => {\n  $4\n}$0"),
				},
				typescript = {
					ls.parser.parse_snippet("mt", "type $1 = {\n  [key in $2]: $3;\n};"),
				},
			}
			ls.filetype_extend("typescript", { "javascript" })
			ls.filetype_extend("javascriptreact", {
				"javascript",
				"typescript",
			})
			ls.filetype_extend("typescriptreact", {
				"javascript",
				"typescript",
				"javascriptreact",
			})
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		config = require("tim.cmp-config").config,
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
		after = "nvim-autopairs",
	})
	use({
		"ellisonleao/gruvbox.nvim",
		config = function()
			local colors = require("gruvbox.palette")
			require("gruvbox").setup({})
		end,
	})
	-- use({
	-- 	"projekt0n/github-nvim-theme",
	-- 	config = function()
	-- 		require("github-theme").setup({})
	-- 	end,
	-- })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = { theme = "gruvbox", globalstatus = true },
			})
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		config = require("tim.telescope-config").config,
		requires = { { "nvim-lua/plenary.nvim" } },
		after = { "telescope-fzf-native.nvim" },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "bogado/file-line" })
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({ signs = false })
		end,
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		requires = { { "JoosepAlviste/nvim-ts-context-commentstring" } },
	})
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({ open_mapping = [[<c-t>]] })
		end,
	})
	use({ "junegunn/rainbow_parentheses.vim" })
	use({
		"preservim/vim-markdown",
		config = function()
			vim.api.nvim_exec(
				[[
        let g:vim_markdown_folding_disabled = 1
        let g:vim_markdown_new_list_item_indent = 0
      ]],
				true
			)
		end,
		requires = { { "godlygeek/tabular" } },
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"phaazon/hop.nvim",
		config = function()
			local hop = require("hop")
			hop.setup({ keys = "tnseriaodhvk" })
			vim.keymap.set("n", "s", function()
				hop.hint_char2({})
			end)
			vim.keymap.set("v", "s", function()
				hop.hint_char2({})
			end)
		end,
	})
	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = { "mn" },
				timeout = 200,
			})
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			local zen = require("zen-mode")
			zen.setup({
				window = { backdrop = 1, options = { number = false } },
			})
			vim.keymap.set("n", "<leader>z", function()
				zen.toggle()
			end)
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	})
	use({
		"ray-x/go.nvim",
		config = function()
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			require("go").setup({
				lsp_cfg = {
					on_attach = require("tim.lsp-config").on_attach,
					capabilities = capabilities,
					flags = { debounce_text_changes = 150 },
				},
			})
			local format_on_save = "format_on_save"
			vim.api.nvim_create_augroup(format_on_save, { clear = true })
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = "*.go",
				callback = function()
					require("go.format").goimport()
				end,
				group = format_on_save,
			})
		end,
	})
	use({ "wellle/targets.vim" })
	use({ "jesseschalken/list-text-object", after = { "targets.vim" } })
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	use({
		"yamatsum/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup({
				cursorline = { enable = false },
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				},
			})
		end,
	})
	use({ "vim-scripts/restore_view.vim" })
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	})
end)
