function ConcatPath(path1, path2)
    return vim.fn.resolve(path1 .. '/' .. path2)
end

local plugins = {
    -- telescope.nvim
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        config = function()
            require'telescope'.load_extension'live_grep_args'
        end,
    },
    -- telescope-fzf-native.nvim
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        dependencies = {
            "telescope.nvim"
        },
        config = function()
            require'telescope'.load_extension'fzf'
        end,
    },
    -- lir.nvim + extensions
    {
        "tamago324/lir.nvim",
        opts = function()
            local actions = require'lir.actions'
            local mark_actions = require'lir.mark.actions'
            local clipboard_actions = require'lir.clipboard.actions'
            local mmv_actions = require'lir.mmv.actions'

            return {
                show_hidden_files = true,
                ignore = { ".git", },
                devicons = {
                    enable = true,
                    hightlight_dirname = true,
                },
                mappings = {
                    ['l'] = actions.edit,
                    ['<C-s>'] = actions.split,
                    ['<C-v>'] = actions.vsplit,
                    ['<C-t>'] = actions.tabedit,

                    ['h'] = actions.up,
                    ['q'] = actions.quit,

                    ['K'] = actions.mkdir,
                    ['N'] = actions.newfile,
                    ['R'] = actions.rename,
                    ['@'] = actions.cd,
                    ['Y'] = actions.yank_path,
                    ['.'] = actions.toggle_show_hidden,
                    ['D'] = actions.delete,

                    ['J'] = function()
                        mark_actions.toggle_mark'v'
                        vim.cmd 'normal! j'
                    end,
                    ['C'] = clipboard_actions.copy,
                    ['X'] = clipboard_actions.cut,
                    ['P'] = clipboard_actions.paste,

                    ['M'] = mmv_actions.mmv,
                }
            }
        end,
        config = function(_, opts)
            require'lir'.setup(opts)
            require'nvim-web-devicons'.set_icon{
                lir_folder_icon = {
                    icon = "",
                    color = "#7ebae4",
                    name = "LirFolderNode"
                },
            }
            vim.api.nvim_create_autocmd({'FileType'}, {
                pattern = { "lir" },
                callback = function()
                    vim.keymap.set(
                        'x', 'J',
                        function()
                            require'lir.mark.actions'.toggle_mark'v'
                        end,
                        { buffer = true, noremap = true, silent = true, }
                    )
                    vim.api.nvim_echo(
                        {{ vim.fn.expand("%:p"), "Normal" }},
                        false,
                        {}
                    )
                end
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "lir-mmv.nvim",
            "lir-git-status.nvim",
        }
    },
    {
        "tamago324/lir-mmv.nvim",
    },
    {
        "tamago324/lir-git-status.nvim",
        opts = { show_ignored = true, },
        config = function(_, opts)
            require'lir.git_status'.setup(opts)
        end,
    },
    -- vim-fugitive
    "tpope/vim-fugitive",
    -- project.nvim
    {
        "ahmedkhalf/project.nvim",
        opts = { manual_mode = true },
        dependencies = {
            "telescope.nvim",
        },
        config = function(_, opts)
            require'project_nvim'.setup(opts)
            require'telescope'.load_extension'projects'
        end,
    },
    -- trouble.nvim
    {
        "folke/trouble.nvim",
        opts = {},
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    },
}

-- octo.nvim
if require'dependencies'.enable_github then
    table.insert(plugins, {
        "pwntester/octo.nvim",
        opts = {},
        dependencies = {
            "telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        }
    })
end
-- nvimcord
if require'dependencies'.enable_discord then
    table.insert(plugins, {
        "ObserverOfTime/nvimcord",
        branch = "workspace",
        opts = {
            autostart = true,
            large_file_icon = true,
            dynamic_workspace = true,
        }
    })
end

return plugins
