local functions = require'config.functions'

-- Create mappings to load interactive shells in different
-- window configurations
vim.keymap.set('n', '<leader>sh', functions.createShell, {})
vim.keymap.set('n', '<leader>ss', function()
    vim.cmd 'new'
    functions.createShell()
end, {})
vim.keymap.set('n', '<leader>sv', function()
    vim.cmd 'vnew'
    functions.createShell()
end, {})
vim.keymap.set('n', '<leader>sf', functions.floatingShell, {})

