return {
    -- twilight.nvim
    {
        "folke/twilight.nvim",
        opts = {
            dimming = { alpha = 0.7, },
            context = 20,
        },
    },
    -- zen-mode.nvim
    {
        "folke/zen-mode.nvim",
        opts = {},
        dependencies = {
            "twilight.nvim",
        },
    },
    -- alpha-nvim
    {
        "goolord/alpha-nvim",
        lazy = false,
        opts = require'config.alphasetup'.config,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
}
