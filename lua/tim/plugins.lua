return require("packer").startup(function()
  use { "wbthomason/packer.nvim" }
  use {
    "nvim-treesitter/nvim-treesitter",
    config = require("tim.treesitter-config").config,
    run = ":TSUpdate",
    requires = {
      { "windwp/nvim-ts-autotag" }, { "p00f/nvim-ts-rainbow" }
    }
  }
  use { "tpope/vim-surround" }
  use {
    "bkad/CamelCaseMotion",
    config = function()
      vim.cmd("map <silent> w <Plug>CamelCaseMotion_w")
      vim.cmd("map <silent> b <Plug>CamelCaseMotion_b")
      vim.cmd("map <silent> e <Plug>CamelCaseMotion_e")
    end
  }
  use {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }
  use {
    "abecodes/tabout.nvim",
    config = function()
      require("tabout").setup()
    end,
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" }
  }
  use {
    "mhartington/formatter.nvim",
    config = function()
      local prettierConfig = function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
          },
          stdin = true
        }
      end
      require("formatter").setup({
        filetype = {
          lua = {
            function()
              return { exe = "lua-format", stdin = true }
            end
          },
          json = { prettierConfig },
          html = { prettierConfig },
          javascript = { prettierConfig },
          typescript = { prettierConfig },
          typescriptreact = { prettierConfig },
          cpp = {
            function()
              return {
                exe = "clang-format",
                args = {
                  "--assume-filename", vim.api.nvim_buf_get_name(0)
                },
                stdin = true,
                cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file
              }
            end
          }
        }
      })
    end
  }
  use {
    "neovim/nvim-lspconfig",
    config = require("tim.lsp-config").config,
    requires = { { "hrsh7th/nvim-cmp" } }
  }
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      ls.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true
      }
      ls.snippets = {
        javascript = {
          ls.parser.parse_snippet("ecf", "export const $1 = ($2)$3 => {\n  $4\n}$0"),
          ls.parser.parse_snippet("cf", "const $1 = ($2)$3 => {\n  $4\n}$0")
        },
        typescript = {
          ls.parser.parse_snippet("mt", "type $1 = {\n  [key in $2]: $3;\n};")
        }
      }
      ls.filetype_extend("typescript", { "javascript" })
      ls.filetype_extend("javascriptreact", {
        "javascript", "typescript"
      })
      ls.filetype_extend("typescriptreact", {
        "javascript", "typescript", "javascriptreact"
      })
    end
  }
  use {
    "hrsh7th/nvim-cmp",
    config = require("tim.cmp-config").config,
    requires = {
      { "hrsh7th/cmp-nvim-lsp" }, { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" }
    },
    after = "nvim-autopairs"
  }
  use {
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({})
    end
  }
  use {
    "nvim-lualine/lualine.nvim",
    after = "github-nvim-theme",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup({
        options = { theme = "auto", globalstatus = true }
      })
    end
  }
  use {
    "nvim-telescope/telescope.nvim",
    config = require("tim.telescope-config").config,
    requires = { { "nvim-lua/plenary.nvim" } },
    after = { "telescope-fzf-native.nvim" }
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "bogado/file-line" }
  use {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup { signs = false }
    end
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    requires = { { "JoosepAlviste/nvim-ts-context-commentstring" } }
  }
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require"toggleterm".setup { open_mapping = [[<c-t>]] }
    end
  }
  use { "junegunn/rainbow_parentheses.vim" }
  use {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup({
        picker = "telescope",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            on_attach = require("tim.lsp-config").on_attach
          }
        }
      })
    end
  }
  use {
    "preservim/vim-markdown",
    config = function()
      vim.api.nvim_exec([[
        let g:vim_markdown_folding_disabled = 1
        let g:vim_markdown_new_list_item_indent = 0
      ]], true)
    end,
    requires = { { "godlygeek/tabular" } }
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end
  }
  use { "lewis6991/impatient.nvim" }
  use { "dstein64/vim-startuptime" }
  use {
    "phaazon/hop.nvim",
    config = function()
      local hop = require("hop")
      hop.setup({ keys = "tnseriaodhvk" })
      vim.keymap.set("n", "s", function()
        hop.hint_char2({})
      end)
    end
  }
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "mn" },
        timeout = 200
      })
    end
  }
  use {
    "folke/zen-mode.nvim",
    config = function()
      local zen = require("zen-mode")
      zen.setup({
        window = { backdrop = 1, options = { number = false } }
      })
      vim.keymap.set("n", "<leader>z", function()
        zen.toggle()
      end)
    end
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true
      }
    end
  }
  -- use {
  --   "ray-x/go.nvim",
  --   config = function()
  --     local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  --     require("go").setup({
  --       lsp_cfg = {
  --         on_attach = require("tim.lsp-config").on_attach,
  --         capabilities = capabilities,
  --         flags = { debounce_text_changes = 150 }
  --       }
  --     })
  --     local format_on_save = "format_on_save"
  --     vim.api.nvim_create_augroup(format_on_save, { clear = true })
  --     vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  --       pattern = "*.go",
  --       callback = function()
  --         require("go.format").goimport()
  --       end,
  --       group = format_on_save
  --     })
  --   end
  -- }
  use {
    "cuducos/yaml.nvim",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim"
    }
  }
end)
