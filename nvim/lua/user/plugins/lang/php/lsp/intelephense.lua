
--- @type LSPServerOptions
return {
    init_options = {
        globalStoragePath = vim.fn.expand('$HOME/.local/state/intelephense'),
        licenceKey = vim.fn.expand('$HOME/.config/intelephense/licence.txt'),
    },
    settings = {
        intelephense = {
            files = {
                maxSize = 10000000,
                exclude = {
                    "**/.git/**",
                    "**/.svn/**",
                    "**/.hg/**",
                    "**/CVS/**",
                    "**/.DS_Store/**",
                    "**/node_modules/**",
                    "**/bower_components/**",
                    "**/vendor/**/{Tests,tests}/**",
                    "**/vendor/fakerphp/**",
                    "**/.history/**",
                    "**/vendor/**/vendor/**"
                }
            },
            completion = {
                maxItems = 40
            },
            environment = {
                shortOpenTags = true
            }
        }
    }
}
