return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = '*',
    event = "VeryLazy",
    opts = {
      keymap = {
        ['<CR>'] = { 'accept', 'fallback' },
        ['<ESC>'] = {
          function(cmp)
            cmp.cancel()
            return false -- run the next command
          end,
          'fallback'
        },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
      },
      sources = {
        default = {'lazydev', 'lsp', 'path', 'buffer', 'snippets'},
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "luasocket-types/library", words = { "socket" } },
      },
    },
  },


  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- gem install --user-install solargraph
      -- sudo npm install -g vim-language-server
      local lspconfig = require('lspconfig')
      local servers = {'vimls', 'lua_ls'}
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup{
          capabilities = capabilities
        }
      end

      -- installed gopls through vim-go
      lspconfig['gopls'].setup{
        capabilities = capabilities,
        cmd = { "gopls", "-remote=auto" },
        settings = {
          gopls = {
            ["build.directoryFilters"] = {"-**/node_modules", "-**/deps", "-**/debian"},
          },
        }
      }

      -- sudo npm install -g vscode-json-languageserver
      lspconfig['jsonls'].setup{
        cmd = { "vscode-json-languageserver", "--stdio" },
        capabilities = capabilities
      }
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require('lsp_signature').setup({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded"
        }
      })
    end,
  },

}
