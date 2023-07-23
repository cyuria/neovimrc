
local cmp = require'cmp'

local default = {
    capabilities = cmp.capabilities,
}

local customconfig = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
            },
        },
        capabilities = cmp.capabilities,
    },
    cmake = {
        settings = {
            CMake = {
                filetypes = {
                    "cmake",
                    "cmakelists.txt"
                },
            },
        },
    },
}

local function get(lsp)
    return customconfig[lsp] or default
end

return {
    get = get,
    default = default,
    config = customconfig,
}

