return {
    enable_github = vim.fn.executable 'gh' == 1,
    enable_discord = vim.fn.executable 'discord' == 1,
}
