-- LazyVim
require("config.lazy")
-- Nvim Settings
require("config.configs")
-- Theme
require("config.colors")
-- KeyBindings
require("config.mappings")
-- Плагин для дерева файлов
require("plugins.nvim-tree")
-- Плагин для быстрой навигации по файлам
require("plugins.telescope")
-- Language Server Protocol
require("plugins.lsp")
-- Плагин для автокомплита
require("plugins.cmp")
-- Плагин Git Signs
require("plugins.gitsigns")
-- Плагин менеджер окон
require("plugins.bufferline")
-- Менеджер пакетов
require("plugins.mason")
-- StatusLine
require("plugins.feline")
-- Заставка
require'alpha'.setup(require'plugins.startify'.config)
-- Плагин для комментирования
-- require('plugins.comment')
-- Плагин indent-blankline
require("ibl").setup()
-- Плагин Obsidian
-- require("plugins.obsidian")
-- Плагины для дебага
require("plugins.dap")
require("dap-python").setup("python3")
require("dapui").setup()
-- autoclose brackets
require("autoclose").setup()
-- Syntax Highlighting
require("plugins.treesitter")
