return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    opts = {
      rocks = { "luasocket" },
      luarocks_build_args = { "--lua-version=5.1" }, -- extra options to pass to luarocks's configuration script
    },
  },
  { "LuaCATS/luasocket", name = "luasocket-types", lazy = true },

  { "tpope/vim-eunuch", event = "VeryLazy" },
  { "tpope/vim-commentary", event = "VeryLazy" },
  { "tpope/vim-sleuth", event = "VeryLazy" },
  {
    "tpope/vim-dispatch",
    event = "VeryLazy",
    init = function()
      vim.g.dispatch_no_maps = 1
    end,
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-fugitive", event = "VeryLazy" },

  { "stevearc/dressing.nvim", event = "VeryLazy" },
  { "kevinhwang91/nvim-bqf", ft = "qf", event = "VeryLazy" },


  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

  { "mbbill/undotree", event = "VeryLazy" },
  {
    "lervag/vimtex",
    event = "VeryLazy",
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_latexmk = 'nvr'
    end,
  },
  -- NOTE: this plugin is so slow
  -- consider replacing with mkdnflow
  -- https://github.com/jakewvincent/mkdnflow.nvim
  {
        'jakewvincent/mkdnflow.nvim',
        config = function()
            require('mkdnflow').setup({
                -- Config goes here; leave blank for defaults
            })
        end
      },
      -- { "dkarter/bullets.vim", event = "VeryLazy" },
      {
        "fatih/vim-go",
        build = ":GoUpdateBinaries",
        event = "VeryLazy",
        init = function()
          -- disable vim-go :GoDef short cut (gd)
          -- this is handled by LanguageClient [LC]
          vim.g.go_def_mapping_enabled = 0
          vim.g.go_metalinter_autosave = 0

          -- NOTE: comment this line out when enabling LSP
          -- vim.g.go_gopls_enabled = 0
          vim.g.go_fmt_autosave = 0
          vim.g.go_mod_fmt_autosave = 0
          vim.g.go_imports_autosave = 0

          vim.g.go_highlight_string_spellcheck = 0
          vim.g.go_highlight_format_strings = 0
          vim.g.go_highlight_diagnostic_errors = 0
          vim.g.go_highlight_diagnostic_warnings = 0
          vim.g.go_highlight_debug = 0
          vim.g.go_highlight_structs = 0
          vim.g.go_highlight_interfaces = 0
          vim.g.go_highlight_operators = 0

          -- NOTE: this is to prevent :w from stalling while gopls is starting up
          -- vim.g.go_def_mode = 'godef'
          -- vim.g.go_referrers_mode = 'guru'
          -- vim.g.go_implements_mode = 'guru'
          -- vim.g.go_fmt_mode = 'goimports'
          -- vim.g.go_imports_mode = 'goimports'
        end,
      },
      { "hashivim/vim-hashicorp-tools", event = "VeryLazy" },
      { "Joorem/vim-haproxy", event = "VeryLazy" },
      { "robbles/logstash.vim", event = "VeryLazy" },


      { "vim-pandoc/vim-pandoc-syntax", event = "VeryLazy" },
      { "vim-pandoc/vim-pandoc", event = "VeryLazy" },
      { "aklt/plantuml-syntax", event = "VeryLazy" },
      {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown", "plantuml" },
        build = function()
          vim.fn["mkdp#util#install"]()
        end,
      },

      { "rafamadriz/friendly-snippets", event = "VeryLazy" },

      { "milisims/nvim-luaref", event = "VeryLazy" },
      { "nanotee/luv-vimdocs", event = "VeryLazy" },

      { "alec-gibson/nvim-tetris", branch = "dev", event = "VeryLazy" },
    }
