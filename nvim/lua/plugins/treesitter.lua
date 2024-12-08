local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", 'css', 'python' },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },  
})

vim.api.nvim_set_hl(0, "@text.todo", {})
