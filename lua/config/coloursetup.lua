
-- Setup light and dark mode functions and mappings
local function dark()
    vim.cmd.colorscheme(vim.g.darkscheme)
end
local function light()
    vim.cmd.colorscheme(vim.g.lightscheme)
end
vim.api.nvim_create_user_command('Dark', dark, {})
vim.api.nvim_create_user_command('Light', light, {})

-- Set default light and dark schemes
vim.g.darkscheme = "tokyonight"
vim.g.lightscheme = "kanagawa-lotus"

-- configure colorscheme dependent options
vim.g.gruvbox_contrast_dark = 'soft'
vim.g.ayucolor = 'mirage'

return {
    dark = dark,
    light = light
}
