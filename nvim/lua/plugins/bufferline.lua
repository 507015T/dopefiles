vim.opt.termguicolors = true
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
        },
})

