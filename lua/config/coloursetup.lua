
local doubleschemes = {
    "edge",
    "gruvbox",
    "kanagawa",
    "lunaperche",
    "quiet",
    "retrobox",
    "tokyonight",
    "wildcharm",
}

-- Set default light and dark schemes and configure colorscheme dependent options
vim.g.darkscheme = "sorbet"
vim.g.lightscheme = "shine"
if require 'dependencies'.enable_plugins then
    vim.g.darkscheme = "elly"
    vim.g.lightscheme = "kanagawa-lotus"

    vim.g.gruvbox_contrast_dark = 'soft'
    vim.g.ayucolor = 'mirage'
end

-- Setup light and dark mode functions and mappings
local function make_transparent()
    vim.cmd('highlight Normal guibg=none')
end
local function dark()
    vim.o.background = 'dark'
    if vim.tbl_contains(doubleschemes, vim.g.colors_name) then
        return
    end
    vim.cmd('colorscheme ' .. vim.g.darkscheme)
end
local function light()
    vim.o.background = 'light'
    if vim.tbl_contains(doubleschemes, vim.g.colors_name) then
        return
    end
    vim.cmd('colorscheme ' .. vim.g.lightscheme)
end
vim.api.nvim_create_user_command('Transparent', dark, {})
vim.api.nvim_create_user_command('Dark', dark, {})
vim.api.nvim_create_user_command('Light', light, {})

return {
    make_transparent = make_transparent,
    dark = dark,
    light = light,
}
