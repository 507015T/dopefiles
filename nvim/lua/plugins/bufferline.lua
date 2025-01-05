
-- Плагин менеджер окон
return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup ({
            options = {
                    mode = "buffers", -- set to "tabs" to only show tabpages instead
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                },
            highlights = {
                    buffer_selected = {
                        italic = true, -- задает наклонный стиль текста
                        bold = true,
                    },
                }
        })
    vim.opt.termguicolors = true
    end,
}
