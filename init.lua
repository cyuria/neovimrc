-- Enable profiling
if require'dependencies'.enable_version then
    vim.loader.enable()
end

require'config.optsetup'
if require'dependencies' then
    require'config.lazysetup'
end
require'config.remap'
require'config.autocommands'.load()
require'config.coloursetup'
require'config.felinesetup'
require'config.tabbysetup'

-- Set colorscheme
vim.cmd("colorscheme tokyonight-night")

