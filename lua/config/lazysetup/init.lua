-- Setup manual git loading for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- If lazy doesn't exist in the filesystem, then git clone it
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

-- Add lazy path to $RUNTIMEPATH for require'lazy' below
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "seandewar/nvimesweeper",
    "alec-gibson/nvim-tetris",
    { import = 'config.lazysetup.lazylspsetup' },
    { import = 'config.lazysetup.lazystylesetup' },
    { import = 'config.lazysetup.lazycoloursetup' },
    { import = 'config.lazysetup.lazyutilitysetup' },
    { import = 'config.lazysetup.lazyworkspacesetup' },
    { import = 'config.lazysetup.lazyenvironmentsetup' },
}

local lazyopts = {
    dev = {
        path = "~/Documents/programming",
        patterns = { "Cyuria", },
        fallback = true,
    },
    install = {
        colorscheme = {
            "tokyonight",
            "kanagawa-dragon",
            "nightfox",
            "habamax",
        },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
}

require 'lazy'.setup(plugins, lazyopts)
