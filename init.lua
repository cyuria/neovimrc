-- Enable profiling
vim.loader.enable()

-- Neovim doesn't like command line arguments without this
for buffer = 1, vim.fn.bufnr('$') do
    local bufname = vim.api.nvim_buf_get_name(buffer)
    if bufname ~= "" and vim.bo[buffer].buftype == "nofile" then
        vim.bo[buffer].buftype = ""
        if vim.fn.buflisted(buffer) then
            vim.api.nvim_buf_call(buffer, vim.cmd.edit)
        end
    end
end

require'config.optsetup'
require'config.lazysetup'
require'config.remap'
require'config.autocommands'.load()
require'config.coloursetup'
require'config.felinesetup'
require'config.tabbysetup'

-- Set colorscheme
vim.cmd("colorscheme tokyonight-night")

