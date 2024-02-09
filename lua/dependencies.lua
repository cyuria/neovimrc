local version = vim.version()

return {
    enable_version = version.major >= 1 or version.minor >= 10,
    enable_github = vim.fn.executable 'gh' == 1,
    enable_discord = vim.fn.executable 'discord' == 1,
}
