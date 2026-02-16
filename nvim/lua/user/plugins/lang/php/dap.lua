local mason = require('user.utils.mason')

return {
    mason.ensure_installed('php-debug-adapter'),
    {
        "mfussenegger/nvim-dap",
        optional = true,
        opts = {
            php = {
                adapter = {
                    type = 'executable',
                    command = mason.binary('php-debug-adapter'),
                },
                configurations = {
                    {
                        name = "PHP: Listen for Xdebug",
                        port = 9003,
                        request = "launch",
                        type = "php",
                        breakpoints = {
                            exception = {
                                Notice = false,
                                Warning = false,
                                Error = false,
                                Exception = false,
                                ["*"] = false,
                            },
                        },
                        pathMappings = {
                            ["/app"] = "${workspaceFolder}"
                        }
                    }
                }
            }
        }
    },
}
