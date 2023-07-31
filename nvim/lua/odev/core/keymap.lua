local P = {}
keymaps = P
-- global key mapper leader
vim.g.mapleader = " "

-- make it precise
local keymap = vim.keymap -- common key bind
-- terminal command
keymap.set("n", "<leader>pv", vim.cmd.Ex) -- trigger terminal explorer

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x') -- go to end/start of the line
keymap.set("n", "gts", "0")
keymap.set("n", "gte", "%")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<C-h>", "<C-w><Left>") -- move to left screen
keymap.set("n", "<C-l>", "<C-w><Right>") -- move to right screen
keymap.set("n", "<C-j>", "<C-w><Up>") -- move to up screen
keymap.set("n", "<C-k>", "<C-w><Down>") -- move to down screen
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- plugin key bind

-- nvim telescope
local builtin_status, builtin = pcall(require, "telescope.builtin")
if not builtin_status then
	return
end

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", function()
	builtin.grep_string({ search = vim.fn.input("Grep >") })
end) -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- float term
keymap.set("n", "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
keymap.set("n", "t", ":FloatermToggle myfloat<CR>")
keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")

-- git
keymap.set("n", "<leader>gs", vim.cmd.Git)

-- dap
keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>dbc", ":lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", "<leader>do", ":lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>ds", ":lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dc", ":lua require'dap'.disconnect({ terminateDebuggee = true })<cr>")

-- dapui
keymap.set("n", "<leader>duio", ":lua require'dapui'.open()<cr>")
keymap.set("n", "<leader>duic", ":lua require'dapui'.close()<cr>")

-- Java
function P.map_java_keys(bufnr)
	keymap.set("n", "<leader>oi", ':lua require("jdtls").organize_imports()<CR>')
	keymap.set("n", "<leader>jc", ':lua require("jdtls).compile("incremental")')
end

return P
