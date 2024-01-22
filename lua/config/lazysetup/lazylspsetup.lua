return {
    -- LuaSnip
    {
        "L3MON4D3/LuaSnip",
        version = "1.2.*",
        lazy = true,
        build = "make install_jsregexp",
        config = function()
            -- Uncomment to use friendly snippets
            -- This is commented because of the over 500ms
            -- startup delay induced by using the code

            require'luasnip.loaders.from_vscode'.load()
        end,
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
    },
    -- mason.nvim
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        lazy = true,
        event = "BufReadPre",
        cmd = "Mason",
        opts = {},
        config = function()
            local lspconfig = require'lspconfig'
            local myconfig = require'config.lspsetup'

            require'mason'.setup()
            require'mason-lspconfig'.setup()
            require'mason-lspconfig'.setup_handlers {
                -- Default setup
                function(lspname)
                    local config = myconfig.get(lspname)
                    lspconfig[lspname].setup(config)
                end,
            }

        end,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "cmp-nvim-lsp",

            "p00f/clangd_extensions.nvim",
            "simrat39/rust-tools.nvim",
            "jose-elias-alvarez/typescript.nvim",
        },
    },
    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        opts = function()
            local cmp = require'cmp'
            return {
                snippet = {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<CR>'] = require'cmp'.mapping.confirm({ select = true })
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = (function()
                        local config = cmp.config.window.bordered()
                        --config.zindex = -1
                        return config
                    end)()
                },
                formatting = {
                    format = require'lspkind'.cmp_format {}
                },
            }
        end,
        dependencies = {
            "LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
        },
    },
    -- nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = "all",
            sync_install = false,
            auto_install = true,
            -- The following types fail to compile. Its fine except for
            -- typescript/tsx which I might want to use at some point
            --[[
            ignore_install = {
                "d",
                "janet_simple",
                "ocaml",
                "ocaml_interface",
                "qmljs",
                "rnoweb",
                "twig",
                "tsx",
                "typescript",
                "wing",
            },
            ]]--
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
        config = function(_, opts)
            -- Use clang, as other compilers break stuff
            require 'nvim-treesitter.install'.compilers = { "clang" }
            -- Use tar + curl instead of git
            require 'nvim-treesitter.install'.prefer_git = false
            -- Initialise treesitter
            require'nvim-treesitter.configs'.setup(opts)

            vim.treesitter.language.register("htmldjango", "html")
        end,
    },

}
