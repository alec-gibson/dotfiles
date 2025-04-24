return {

  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require'nvim-web-devicons'.setup {
        -- your personnal icons can go here (to override)
        -- DevIcon will be appended to `name`
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            name = "Zsh"
          }
        };
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged_enable = true,
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("neo-tree").setup({
        filesystem = {
          window = {
            mappings = {
              -- disable fuzzy finder
              ["/"] = "noop"
            }
          }
        }
      })
    end,
  },

  {
    "adisen99/codeschool.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      require('lush')(require('codeschool').setup({
        plugins = {
          -- "cmp", -- nvim-cmp
          "gitsigns",
          "lsp",
          "nvimtree",
          "packer",
          "treesitter"
        },
        langs = {
          "c",
          "clojure",
          "coffeescript",
          "csharp",
          "css",
          "elixir",
          "golang",
          "haskell",
          "html",
          "java",
          "js",
          "json",
          "jsx",
          "lua",
          "markdown",
          "moonscript",
          "objc",
          "ocaml",
          "purescript",
          "python",
          "ruby",
          "rust",
          "scala",
          "typescript",
          "viml",
          "xml"
        }
      }))
    end,
  },

  {
    "hoob3rt/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require'lualine'.setup {
        options = {
          icons_enabled = true,
          theme = 'modus-vivendi',
          component_separators = {'', ''},
          section_separators = {'', ''},
          disabled_filetypes = {},
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch'},
          lualine_c = {'filename', 'lsp_progress'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {'quickfix', 'fugitive', 'nvim-tree'}
      }
    end,
  },

  {
    "arkav/lualine-lsp-progress",
    dependencies = "hoob3rt/lualine.nvim",
    event = "VeryLazy",
  },

  {
    "alvarosevilla95/luatab.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require'luatab'.setup{}
    end,
  },

  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      require'diffview'.setup{}
    end
  },
}
