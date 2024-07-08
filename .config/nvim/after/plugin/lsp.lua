local lsp = require('lsp-zero')
lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y'] = cmp.mapping.confirm({select = true }),
	['<C-Space'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'rust_analyzer'},
	handlers = {
		lsp.default_setup,
	},
})

lsp.setup()
