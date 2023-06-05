-- require('telescope').setup {
--   local project_actions = require("telescope._extensions.project.actions")
--   extensions = {
--     project = {
--       base_dirs = {},
--       hidden_files = true, -- default: false
--       theme = "dropdown",
--       order_by = "asc",
--       search_by = "title",
--       sync_with_nvim_tree = false, -- default false
--       -- default for on_project_selected = find project files
--       on_project_selected = function(prompt_bufnr)
--         -- Do anything you want in here. For example:
--         project_actions.change_working_directory(prompt_bufnr, false)
--         require("harpoon.ui").nav_file(1)
--       end
--     }
--   }
-- }
--
require'telescope'.extensions.project.project{}

require('telescope').load_extension('bookmarks')

local builtin = require('telescope.builtin')


vim.api.nvim_set_keymap(
        'n',
        '<C-p>',
        ":lua require'telescope'.extensions.project.project{}<CR>",
        {noremap = true, silent = true}
)
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})



vim.keymap.set('n', '<leader>pf', builtin.find_files, {})




