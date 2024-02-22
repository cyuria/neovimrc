return {
    -- which-key.nvim
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
    },
    -- persistence.nvim
    {
        "folke/persistence.nvim",
        opts = {},
    },
    -- auto-save
    {
        "Pocco81/auto-save.nvim",
        event = "VeryLazy",
        opts = {
            callbacks = {
                after_saving = require 'config.functions'.reloadCtags
            }
        }
    },
    -- nvim-surround
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {
            keymaps = {
                normal = "<leader>ys",
                normal_cur = "<leader>y<leader>",
                normal_line = "<leader>yS",
                normal_line_cur = "<leader>yS<leader>",
                visual = "<leader>S",
                visual_line = "<leader>gS",
                delete = "<leader>ds",
                change = "<leader>cs",
                change_line = "<leader>cS",
            },
        },
        dependencies = {
            "nvim-treesitter",
        }
    },
    -- nvim-autopairs
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {
            check_ts = true, -- use treesitter
        },
        config = function(_, opts)
            require 'nvim-autopairs'.setup(opts)

            local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
            local cmp = require 'cmp'

            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end,
        dependencies = {
            "nvim-cmp",
        },
    },
    -- nvim-ts-autotag
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
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
            require 'colorizer'.setup(opts.filetypes, opts.defaults)
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
    -- todo-comments.nvim
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "plenary.nvim",
        },
    },
    -- undo tree
    "mbbill/undotree",
    -- vim matchup
    "andymass/vim-matchup",
}
