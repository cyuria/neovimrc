-- Creates an interactive shell process
-- in the current buffer. Returns the job id
-- of the shell
local function createShell(cmd)
    local JID = vim.fn.termopen(vim.g.terminal)
    require'tabby'.update()
    if cmd then
        vim.fn.chansend(JID, cmd)
        vim.fn.chansend(JID, '\r')
    end
    return JID
end

-- Map <c-b> to create a floating window and run createShell(cmd)
local function floatingShell(cmd)
    local stats = vim.api.nvim_list_uis()[1]
    local winconfig = {
        relative = "editor",
        border = "rounded",
        width = math.ceil(stats.width * 0.6),
        height = math.ceil(stats.height * 0.6),
        col = math.ceil(stats.width * 0.2),
        row = math.ceil(stats.height * 0.2)
    }
    local buffer = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_open_win(buffer, true, winconfig)
    return createShell(cmd)
end

local function reloadCtags()
    vim.system({ "/usr/bin/sh", "-c", "rg --files | ctags -f .tags --recurse -L -" })
end

return {
    createShell = createShell,
    floatingShell = floatingShell,
    reloadCtags = reloadCtags,
}

