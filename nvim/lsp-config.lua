local nvim_lsp = require('nvim_lsp')
local buf_set_keymap = vim.api.nvim_buf_set_keymap

local on_attach = function(_, bufnr)
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		require'diagnostic'.on_attach()

		-- Mappings.
		local opts = { noremap=true, silent=true }
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
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

local servers = {'gopls', 'solargraph', 'jdtls', 'jsonls'}
for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup {
				on_attach = on_attach,
		}
end
