local lspconfig = require('lspconfig')

-- installed gopls through vim-go
-- gem install --user-install solargraph
-- sudo npm install -g vscode-json-languageserver
-- sudo npm install -g vim-language-server
-- installed clangd through package manager
-- sudo npm install -g svelte-language-server
local servers = {'gopls', 'solargraph', 'jsonls', 'vimls', 'clangd', 'svelte'}
local sig_cfg = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- only show one line of comment set to 0 if you do not want API comments be shown
  decorator = {"***", "***"},  -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help
  hint_enable = false, -- virtual hint disable
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup{
    on_attach = function()
      require('lsp_signature').on_attach(sig_cfg)
    end
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    -- virtual_text = false,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
  }
)

require('lspkind').init({
    -- with_text = true,
    -- symbol_map = {
    --   Text = '',
    --   Method = 'ƒ',
    --   Function = '',
    --   Constructor = '',
    --   Variable = '',
    --   Class = '',
    --   Interface = 'ﰮ',
    --   Module = '',
    --   Property = '',
    --   Unit = '',
    --   Value = '',
    --   Enum = '了',
    --   Keyword = '',
    --   Snippet = '﬌',
    --   Color = '',
    --   File = '',
    --   Folder = '',
    --   EnumMember = '',
    --   Constant = '',
    --   Struct = ''
    -- },
})

-- require('lspfuzzy').setup {}

-- init.lua
vim.g.symbols_outline = {
    highlight_hovered_item = false,
    show_guides = false,
    auto_preview = false,
    position = 'right',
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
}

require 'lspsaga'.init_lsp_saga()
