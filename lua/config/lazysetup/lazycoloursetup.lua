return {
    -- COLOUR SCHEMES
    "EdenEast/nightfox.nvim",
    "jacoborus/tender.vim",
    -- kanagawa.nvim
    {
        "rebelot/kanagawa.nvim",
        opts = {
            -- Remove gutter background
            colors = { theme = { all = { ui = {
                bg_gutter = nil
            }}}},
            overrides = function(colors)
                local ui = colors.theme.ui
                return {
                    -- Telescope
                    TelescopeTitle = { fg = ui.special, bold = true },
                    TelescopePromptNormal = { bg = ui.bg_p1 },
                    TelescopePromptBorder = { fg = ui.bg_p1, bg = ui.bg_p1 },
                    TelescopeResultsNormal = { fg = ui.fg_dim, bg = ui.bg_m1 },
                    TelescopeResultsBorder = { fg = ui.bg_m1, bg = ui.bg_m1 },
                    TelescopePreviewNormal = { bg = ui.bg_dim },
                    TelescopePreviewBorder = { bg = ui.bg_dim, fg = ui.bg_dim },
                    -- Popup menus
                    Pmenu = { fg = ui.shade0, bg = ui.bg_p1 },
                    PmenuSel = { fg = nil, bg = ui.bg_p2 },
                    PmenuSbar = { bg = ui.bg_m1 },
                    PmenuThumb = { bg = ui.bg_p2 },
                    -- Floating windows
                    NormalFloat = { bg = nil },
                    FloatBorder = { bg = nil },
                    NormalDark = { fg = ui.fg_dim, bg = ui.bg_m3 },
                    LazyNormal = { bg = ui.bg_m3, fg = ui.fg_dim },
                    MasonNormal = { bg = ui.bg_m3, fg = ui.fg_dim },
                }
            end,
        },
    },
    "ellisonleao/gruvbox.nvim",
    "sjl/badwolf",
    "romainl/apprentice",
    "yorickpeterse/happy_hacking.vim",
    -- tokyonight.nvim
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = {
            style = "night",
            light_style = "day",
            day_brightness = 0.6,
            dim_inactive = true,
            on_colors = function(colours)
                colours.comment = "#738ca4"
                colours.bg_sidebar = nil
                colours.bg_float = nil
                colours.bg_statusline = nil
            end,
            on_highlights = function(hl, c)
                hl.Folded = {
                    bg = nil,
                    fg = '#7b869c'
                }
                local blank = {
                    bg = nil,
                    fg = "#000000",
                }

                -- Telescope
                hl.TelescopePreviewTitle = blank
                hl.TelescopeResultsTitle = blank
                hl.TelescopeBorder = {
                    bg = nil,
                    fg = hl.TelescopeBorder.fg, -- Use the default brder colour
                }
                hl.TelescopeNormal = {
                    bg = nil,
                    fg = nil
                }

                hl.TelescopePromptNormal = {
                    bg = nil,
                    fg = c.fg_dark,
                }
                hl.TelescopePromptBorder = {
                    bg = nil,
                    fg = '#20222a',
                }
                hl.TelescopePromptTitle = {
                    bg = nil,
                    fg = '#8c94aa',
                }

                -- tabby
                hl.TabLineSel = {
                    fg = c.fg_dark,
                    bg = nil,
                }
                hl.TabLine = {
                    fg = c.fg_gutter,
                    bg = nil,
                }
            end,
        },
    },
    "sainnhe/edge",
    "lunacookies/vim-colors-xcode",
    "kuuote/elly.vim",
    "jorengarenar/vim-darkness",
    "savq/melange-nvim",
    "luisiacc/gruvbox-baby",
    "blueshirts/darcula",
    "joshdick/onedark.vim",
}
