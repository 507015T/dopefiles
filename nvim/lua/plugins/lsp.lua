-- LSP 
return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        {    "SmiteshP/nvim-navic"},
    },

    config = function()
        -- Настройка Mason
        require("mason").setup()

        -- Настройка Mason LSPConfig
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",            -- Для Lua
                "pyright",           -- Для Python
                "cssls",             -- Для CSS
                "emmet_language_server",  -- Для Emmet
                "clangd",            -- Для C/C++
                "ts_ls",          -- Для TypeScript/JavaScript
                "dockerls",          -- Для Docker
            },
        })

        -- Настройка каждого LSP-сервера
        local lspconfig = require("lspconfig")

        -- Логика подключения серверов
        lspconfig.lua_ls.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
        lspconfig.pyright.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
        lspconfig.cssls.setup({})
        lspconfig.emmet_language_server.setup({})
        lspconfig.clangd.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.dockerls.setup({})

    end,
}

