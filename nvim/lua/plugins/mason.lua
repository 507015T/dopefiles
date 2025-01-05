require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup {
    ensure_installed = {
        "lua_ls",
        "pyright",
        "cssls",
        "emmet_language_server",
        "clangd",
        "ts_ls",
        "dockerls",

    },
    }
