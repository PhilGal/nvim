local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>po', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.grep_string, {})
