return {
    "SmiteshP/nvim-navic",
    config =function ()
        local navic = require("nvim-navic")

        require("lspconfig").lua_ls.setup {
            on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end,
        }
                    require("lspconfig").pyright.setup {
            on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end
        }
                    require("lspconfig").clangd.setup {
            on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end
        }
                    require("lspconfig").ts_ls.setup {
            on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end
        }
    end,
}
