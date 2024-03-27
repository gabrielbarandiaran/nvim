-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

local keymap = vim.keymap.set

keymap('n', ';', ':')
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

keymap('n', '<C-p>', '<C-6>', { desc = 'Remap go to previous file' })

keymap('n', '<space>1', '1gt', { desc = '' })
keymap('n', '<space>2', '2gt', { desc = '' })
keymap('n', '<space>3', '3gt', { desc = '' })
keymap('n', '<space>4', '4gt', { desc = '' })
keymap('n', '<space>5', '5gt', { desc = '' })
keymap('n', '<space>6', '6gt', { desc = '' })
keymap('n', '<space>7', '7gt', { desc = '' })
keymap('n', '<space>8', '8gt', { desc = '' })

keymap('n', '<A-k>', '<cmd>cnext<CR>zz')
keymap('n', '<A-j>', '<cmd>cprev<CR>zz')
keymap('n', '<leader>k', '<cmd>lnext<CR>zz')
keymap('n', '<leader>j', '<cmd>lprev<CR>zz')

keymap('n', '<Tab>', '<cmd>tabnext<CR>')
keymap('n', '<S-Tab>', '<cmd>tabprev<CR>')
