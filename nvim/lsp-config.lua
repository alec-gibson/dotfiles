local lspconfig = require('lspconfig')
local buf_set_keymap = vim.api.nvim_buf_set_keymap

-- gem install --user-install solargraph
-- sudo npm install -g vscode-json-languageserver
-- sudo npm install -g vim-language-server
-- for jdtls: https://github.com/mfussenegger/nvim-jdtls
local servers = {'gopls', 'solargraph', 'jsonls', 'vimls', 'clangd'}
for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup {
				on_attach = on_attach,
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
