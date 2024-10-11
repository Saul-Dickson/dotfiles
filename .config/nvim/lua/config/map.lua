local builtin = require('telescope.builtin')
local wk = require('which-key')
local map = vim.keymap

---------------
-- Find/File --
---------------

-- Describe Mappings --
local lff = "Telescope find files"
local lfg = "Telescope live grep"
local lfb = "Telescope search buffers"
local lfh = "Telescope help tags"
local lfB = "Neotree List Buffers"

--  Define Mappings  --
map.set('n', '<Leader>ff', function() builtin.find_files() end, { desc = lff })
map.set('n', '<Leader>fg', function() builtin.live_grep()  end, { desc = lfg })
map.set('n', '<Leader>fb', function() builtin.buffers()    end, { desc = lfb })
map.set('n', '<Leader>fh', function() builtin.help_tags()  end, { desc = lfh })
map.set('n', '<Leader>fB', ':Neotree toggle buffers<CR>'      , { desc = lfB })

-- Describe Ungrouped --
local C_n = 'Toggle Neotree'

-- Define Ungrouped --
map.set('n', '<C-n>', ':Neotree toggle<CR>', { desc = C_n })

---------------
-- Go-to/lsp --
---------------

local lsp       = vim.lsp
-- local lspconfig = require('lspconfig')

-- Describe Mappings --
local llh = 'Display docs for symbol'
local llH = 'Display signature help'
local lla = 'Show code actions'
local llc = 'Rename symbol & references'
local gd  = 'Go to definition'
local gD  = 'Go to declaration'
local gi  = 'Go to implementation'
local gt  = 'Go to type-definition'

-- Define Mappings --
map.set('n', '<Leader>lh', lsp.buf.hover          , { desc = llh })
map.set('n', '<Leader>lH', lsp.buf.signature_help , { desc = llH })
map.set('n', '<Leader>la', lsp.buf.code_action    , { desc = lla })
map.set('n', '<Leader>lc', lsp.buf.rename         , { desc = llc })
map.set('n', 'gd'        , lsp.buf.definition     , { desc = gd  })
map.set('n', 'gD'        , lsp.buf.declaration    , { desc = gD  })
map.set('n', 'gi'        , lsp.buf.implementation , { desc = gi  })
map.set('n', 'gt'        , lsp.buf.type_definition, { desc = gt  })
