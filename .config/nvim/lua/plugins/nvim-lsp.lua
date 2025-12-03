
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
			local lspconfig = vim.lsp

			lspconfig.enable('lua_ls')
			lspconfig.enable('jedi_language_server')
			lspconfig.enable('bashls')
			lspconfig.enable('vimls')
			lspconfig.enable('rust_analyzer')
		end
	},
}
