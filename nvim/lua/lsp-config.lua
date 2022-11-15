-- Add additional capabilities supported by nvim-cmp
capabilities = require('cmp_nvim_lsp').default_capabilities()

-- gem install --user-install solargraph
-- sudo npm install -g vim-language-server
local lspconfig = require('lspconfig')
local servers = {'vimls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup{
    capabilities = capabilities
  }
end

-- installed gopls through vim-go
lspconfig['gopls'].setup{
  cmd = { "gopls", "-remote=auto" },
  capabilities = capabilities,
  on_attach = function()
    require('lsp_signature').on_attach(sig_cfg)
  end
}

-- sudo npm install -g vscode-json-languageserver
lspconfig['jsonls'].setup{
  cmd = { "vscode-json-languageserver", "--stdio" },
  capabilities = capabilities
}

require('lspkind').init({})
require('lsp_signature').setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
})

-- init.lua
vim.g.symbols_outline = {
    highlight_hovered_item = false,
    show_guides = false,
    auto_preview = false,
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'tmux' },
  },
}

luasnip.filetype_extend("all", { "_" })
require("luasnip/loaders/from_vscode").lazy_load({ paths = "./snippets" })
