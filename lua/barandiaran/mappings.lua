local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---------- GENERAL ----------

-- Improve command key
keymap("n", ";", ":")
keymap("v", ";", ":")

-- Keep cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

---------- TAB MANAGEMENT ----------

-- Move between split tabs
keymap("n", "<up>", "<C-w><up>", opts)
keymap("n", "<down>", "<C-w><down>", opts)
keymap("n", "<left>", "<C-w><left>", opts)
keymap("n", "<right>", "<C-w><right>", opts)

---------- TEXT MANIPULATION ----------

-- Select all
keymap("n", "<leader>ya", "gg<S-v>G", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w")
keymap("n", "sv", ":vsplit<Return><C-w>w")

-- Paste last thing you yanked, not deleted
keymap("n", "<leader>p", '"0p', opts)
keymap("n", "<leader>P", '"0p', opts)

-- Moving text
keymap("n", "<leader>j", ":m .+1<CR>==", opts)
keymap("n", "<leader>k", ":m .-2<CR>==", opts)
keymap("i", "<C-j>", "<esc>:m .+1<CR>==", opts)
keymap("i", "<C-k>", "<esc>:m .-2<CR>==", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '>-2<CR>gv=gv", opts)

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

---------- PLUGINS ----------

-- LSP
keymap("n", "<C-Space>", ":lua vim.lsp.buf.code_action()<CR>")
keymap("n", "<leader>ft", ":lua vim.lsp.buf.format()<CR>")

-- LSP Saga
keymap("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
keymap("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
keymap("n", "<C-d>", "<Cmd>Lspsaga rename<CR>", opts)

-- NvimTree
keymap("n", "<Tab>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>tg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>td", ":Telescope diagnostics<CR>", opts)

-- DAP
keymap("n", "F5", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Breakpoint condition: '))<CR>", opts)

-- BufferLineCycle
keymap("n", "<C-l>", "<Cmd>BufferLineCycleNext<CR>", {})
keymap("n", "<C-j>", "<Cmd>BufferLineCyclePrev<CR>", {})
