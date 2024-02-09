
-- Setup light and dark mode functions and mappings
local function dark()
    vim.cmd('colorscheme ' .. vim.g.darkscheme)
end
local function light()
    vim.cmd('colorscheme ' .. vim.g.lightscheme)
end
vim.api.nvim_create_user_command('Dark', dark, {})
vim.api.nvim_create_user_command('Light', light, {})

-- Set default light and dark schemes and configure colorscheme dependent options
vim.g.darkscheme = "default"
vim.g.lightscheme = "zellner"
if require 'dependencies'.enable_plugins then
    vim.g.darkscheme = "tokyonight"
    vim.g.lightscheme = "kanagawa-lotus"

    vim.g.gruvbox_contrast_dark = 'soft'
    vim.g.ayucolor = 'mirage'
end

return {
    dark = dark,
    light = light
}
