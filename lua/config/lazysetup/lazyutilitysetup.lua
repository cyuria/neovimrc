return {
    -- which-key.nvim
    {
        "folke/which-key.nvim",
        opts = {},
    },
    -- persistence.nvim
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
    },
    -- auto-save
    {
        "Pocco81/auto-save.nvim",
        opts = {
            callbacks = {
                after_saving = require 'config.functions'.reloadCtags
            }
        }
    },
    -- nvim-surround
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "nvim-treesitter",
        }
    },
    -- nvim-autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true, -- use treesitter
        },
        config = function(_, opts)
            require'nvim-autopairs'.setup(opts)

            local cmp_autopairs = require'nvim-autopairs.completion.cmp'
            local cmp = require'cmp'

            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end,
        dependencies = {
            "nvim-cmp",
        },
    },
    -- mvim-ts-autotag
    {
        "windwp/nvim-ts-autotag",
        config = true,
        dependencies = {
            "nvim-treesitter",
        },
    },
    -- nvim-lastplace
    "ethanholz/nvim-lastplace",
    -- beacon.nvim
    "danilamihailov/beacon.nvim",
    -- nvim-colorizer.lua
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            filetypes = {},
            defaults = {},
        },
        config = function(_, opts)
            require'colorizer'.setup(opts.filetypes, opts.defaults)
        end
    },
    -- gitsigns.nvim
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            current_line_blame = true,
            current_line_blame_formatter = '<author>, <summary> - <author_time:%d/%m/%Y>',
        },
    },
    -- todo.nvim
    {
        "AmeerTaweel/todo.nvim",
        opts = {},
        config = function(_, opts)
            require'todo'.setup(opts)
            require'telescope'.load_extension'todo'
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "telescope.nvim",
        },
    },
    -- undo tree
    "mbbill/undotree"
}
