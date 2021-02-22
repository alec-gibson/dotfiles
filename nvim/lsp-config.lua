local lspconfig = require('lspconfig')
local buf_set_keymap = vim.api.nvim_buf_set_keymap

local on_attach = function(_, bufnr)
		-- Mappings.
		local opts = { noremap=true, silent=true }
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gm', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gy', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>R', '<Cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>o', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
end

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
