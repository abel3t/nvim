vim.g.mapleader = " "

local map = vim.keymap.set



-- File: f



-- project: p



-- Buffer: b


-- Debug: d


-- Terminal: t



-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")


-- neo-tree
map({ "i", "v", "n", "s" }, "<F5>", "<cmd>:Neotree toggle<cr>", { desc = "Neotree toggle" })


-- save file
map({ "n", "v" }, "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window", remap = true })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })


-- toggle term
map({ "i", "v", "n", "s" }, "<F9>", "<cmd>:ToggleTerm<cr>", { desc = "ToggleTerm", silent = true })


local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<S-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<S-l>', '<Cmd>BufferNext<CR>', opts)





-- buffer
map('n', '<leader>bl', '<cmd>BufferLineCycleNext<CR>', opts)
map('n', '<leader>bh', '<cmd>BufferLineCyclePrev<CR>', opts)

map("n", "<leader>bf", vim.lsp.buf.format, { silent = true, desc = "Format Buffer"})





map('n', '<leader>pf', '<cmd>lua require("project_nvim").find_project_files()<CR>', { silent = true, desc = "Find Project Filesiiiii" })
map('n', '<leader>pb', '<cmd>lua require("project_nvim").browse_project_files()<CR>', { silent = true, desc = "Browse Project Files" })
map('n', '<leader>pd', '<cmd>lua require("project_nvim").delete_project()<CR>', { silent = true, desc = "Delete Project" })
map('n', '<leader>ps', '<cmd>lua require("project_nvim").search_in_project_files()<CR>', { silent = true, desc = "Search Project Files" })
map('n', '<leader>pr', '<cmd>lua require("project_nvim").recent_project_files()<CR>', { silent = true, desc = "Recent Project Files" })
map('n', '<leader>pw', '<cmd>lua require("project_nvim").change_working_ directory()<CR>', { silent = true, desc = "Change Working Directory" })



