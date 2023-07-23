
-- configure telescope.nvim
local builtin = require'telescope.builtin'
local telescope = require'telescope'

vim.keymap.set(
    'n',
    '<leader>ff',
    builtin.find_files,
    { desc = "Telescope find_files" }
)
vim.keymap.set(
    'n',
    '<leader>fw',
    builtin.lsp_workspace_symbols,
    { desc = "Telescope workspace_symbols" }
)
vim.keymap.set(
    'n',
    '<leader>fv',
    builtin.treesitter,
    { desc = "Telescope treesitter" }
)
vim.keymap.set(
    'n',
    '<leader>fb',
    builtin.buffers,
    { desc = "Telescope buffers"  }
)
vim.keymap.set(
    'n',
    '<leader>fh',
    builtin.help_tags,
    { desc = "Telescope help" }
)
vim.keymap.set(
    'n',
    '<leader>ft',
    telescope.extensions.todo.todo,
    { desc = "Telescope todo" }
)
vim.keymap.set(
    'n',
    '<leader>fc',
    builtin.colorscheme,
    { desc = "Telescope colourschemes" }
)
vim.keymap.set(
    'n',
    '<leader>fg',
    builtin.live_grep,
    { desc = "Telescope grep" }
)
vim.keymap.set(
    'n',
    '<leader>fl',
    builtin.git_commits,
    { desc = "Telescope git_commits" }
)
-- Search projects
vim.keymap.set(
    'n',
    '<leader>fp',
    telescope.extensions.projects.projects,
    { desc = "Telescope projects" }
)
-- Search the solar system
vim.keymap.set(
    'n',
    '<leader>fu',
    builtin.planets,
    { desc = "Telescope planets" }
)
-- Use the last picker
vim.keymap.set(
    'n',
    '<leader>fr',
    builtin.resume,
    { desc = "Telescope resume" }
)
-- List picker options, <CR> to use them
vim.keymap.set(
    'n',
    '<leader>fa',
    builtin.builtin,
    { desc = "Telescope pickers" }
)

