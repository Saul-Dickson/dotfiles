
return {
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			local install = {
					'lua_ls',
					'jedi_language_server',
					'bashls',
					'vimls',
					'rust_analyzer',
			}
			require('mason-lspconfig').setup({ensure_installed = install})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require('lspconfig')

			lspconfig.lua_ls.setup({})
			lspconfig.jedi_language_server.setup({})
			lspconfig.bashls.setup({})
			lspconfig.vimls.setup({})
			lspconfig.rust_analyzer.setup({})
		end
	},
}
