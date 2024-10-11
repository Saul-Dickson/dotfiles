-- Shortcuts --

local option = vim.opt
local api = vim.api
local command = vim.cmd

-- General Settings --

option.backspace = "indent,eol,start"
option.backup = on
option.backupcopy = "yes"
option.bomb = on
option.bufhidden = "hide"
option.confirm = on
option.exrc = on
option.lisp = on
option.ignorecase = on

-- User Interface  --

option.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" ..
	",a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" ..
	",sm:block-blinkwait175-blinkoff150-blinkon175"
option.mousefocus = on
option.cursorline = on
option.cursorlineopt = "both"
option.background = "dark"
option.colorcolumn = "80"

command.colorscheme("duskfox")

-- Indent --

option.autoindent = on
option.copyindent = on
option.smartindent = on

-- Wrapping --

option.wrap = off
option.breakindent = on
option.showbreak = ">> "

-- Tabbing --

option.expandtab = on
option.softtabstop = 4
option.shiftwidth = 4
option.tabstop = 4

-- Number Column --

option.signcolumn = "number"
local numbercolumn = api.nvim_create_augroup('numbercolumn', { clear = true })
api.nvim_create_autocmd('BufEnter', {
	group = 'numbercolumn',
	command = 'set number'
})
api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave' }, {
	group = 'numbercolumn',
	command = 'set relativenumber'
})
api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter' }, {
	group = 'numbercolumn',
	command = 'set norelativenumber'
})
