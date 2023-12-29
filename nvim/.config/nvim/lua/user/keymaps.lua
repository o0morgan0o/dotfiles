local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- function for mapping Ctrl+Shift per example
-- map('n', '<C-S-j>', '<cmd>:cnf<cr>')
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-S-j>", "<cmd>:lua require('telescope').extensions.recent_files.pick()<cr>")

-- keymap("n", "<Space>", "", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- remap jk to esc
vim.api.nvim_set_keymap("i", "jk", "<ESC>", {})

-- focus nvim tree
vim.keymap.set("n", "<M-1>", "<cmd>:NvimTreeFocus<CR>")

-- format
vim.keymap.set("n", "<C-f>", "<cmd>:lua vim.lsp.buf.format({async = false })<CR>")

-- telescope project
-- vim.keymap.set("n", "<m-p>", "<cmd>:Telescope neovim-project discover<CR>")

-- live grep
map("n", "<C-S-n>", "<cmd>:Telescope live_grep<CR>")

-- telescope find files
vim.keymap.set("n", "<C-p>", "<cmd>:Telescope find_files<CR>")

-- easymotion
vim.keymap.set("n", "<Space>", "<cmd>:HopWord<CR>")

-- comment remapping
vim.keymap.set("n", "<C-/>", function()
	require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })

-- save with control-s
vim.keymap.set("n", "<C-s>", "<cmd>:w<CR>")

-- close with control-w
vim.keymap.set("n", "<C-w>", "<cmd>:q<CR>")

-- open new wezterm tab in current directory
vim.keymap.set("n", "<m-2>", "<cmd>:!wezterm start --cwd .<CR>")

keymap("n", "<C-h>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
-- here are the default mappings
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)
-- my custom mappings for navigation are
--keymap("n", "<m-j>", "<C-w>h", opts)
--keymap("n", "<m-k>", "<C-w>k", opts)
--keymap("n", "<m-k>", "<C-w>l", opts)
--keymap("n", "<m-l>", "<C-w>j", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")
