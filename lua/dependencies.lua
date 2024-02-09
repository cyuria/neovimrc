return {
    enable_version = vim.version().major >= 1 or vim.version.minor() >= 10,
    enable_github = vim.fn.executable 'gh' == 1,
    enable_discord = vim.fn.executable 'discord' == 1,
}
