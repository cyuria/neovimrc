
-- nvim beacon settings
vim.keymap.set('n', 'n', 'n:Beacon<CR>', { noremap=true })
vim.keymap.set('n', 'N', 'N:Beacon<CR>', { noremap=true })
vim.keymap.set('n', '*', '*:Beacon<CR>', { noremap=true })
vim.keymap.set('n', '#', '#:Beacon<CR>', { noremap=true })
vim.keymap.set('n', '<leader>b', vim.fn.Beacon, {})

