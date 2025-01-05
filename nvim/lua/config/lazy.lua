-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup mapleader before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Setup lazy.nvim 
require("lazy").setup({ 
     -- Плагин для дерева файлов
    { "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
    }},
    ---------------------------
    -- Плагин для быстрой навигации по файлам
    {'nvim-telescope/telescope.nvim', tag = '0.1.8',
    branch = "v3.x",
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,}},
    --------------------------
    -- LSP 
    {
      'neovim/nvim-lspconfig',
      -- dependencies = { 'saghen/blink.cmp' },
      --
      -- -- example using `opts` for defining servers
      -- opts = {
      --   servers = {
      --     lua_ls = {}
      --   }
      -- },
      -- config = function()
      --   local capabilities = require('blink.cmp').get_lsp_capabilities()
      --   local lspconfig = require('lspconfig')
      --
      --   lspconfig['lua-ls'].setup({ capabilities = capabilities })
      --   lspconfig['pyright'].setup({ capabilities = capabilities })
      --   lspconfig['emmet-language-server'].setup({ capabilities = capabilities })
      --   lspconfig['cssls'].setup({ capabilities = capabilities })
      --   lspconfig['clangd'].setup({ capabilities = capabilities })
      --   lspconfig['ts_ls'].setup({ capabilities = capabilities })
      --   lspconfig['dockerls'].setup({ capabilities = capabilities })
      -- end
    },
    --------------------------
    -- Плагин для автокомплита
    {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip'
    },
    --------------------------
    -- Плагин для отслеживания изменений git
    { "lewis6991/gitsigns.nvim", },
    --------------------------
    -- Плагин менеджер окон
	{"akinsho/bufferline.nvim", event = "VeryLazy"},
    -- Менеджер пакетов
    { 	"williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim" },
    --------------------------  
    -- StatusLine
    { 'feline-nvim/feline.nvim' },
    --------------------------
    -- Заставка
    { 'goolord/alpha-nvim' },
    --------------------------
    -- Themes
    ----------- catppuccin
     { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -------------------------
    -- Плагин indent-blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    -------------------------
    -- Трекер проведеннего времепни в 
    { 'wakatime/vim-wakatime', lazy = false },
    -------------------------
    -- Debug 
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}},
    {'mfussenegger/nvim-dap-python'},
    -------------------------
    -- autoclose brackets
    { 'm4xshen/autoclose.nvim' },
    -- Подсветка синтаксиса( БЛЯ Я РЕАЛЬНО НЕ ЗАМЕЧАЛ, ЧТО ЗАБЫЛ ЕГО УСТАНОВИТЬ)
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    -- TODO:
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    },
    {
      'kristijanhusak/vim-dadbod-ui',
      dependencies = {
        { 'tpope/vim-dadbod', lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
      },
      cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
      },
      init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
      end,
    },
    -------------------------------
    {
      "craftzdog/solarized-osaka.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
        -- add any options here
      },
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    },
    ----------------------
    -- {
    --   'saghen/blink.cmp',
    --   dependencies = 'rafamadriz/friendly-snippets',
    --   version = '*',
    --   ---@module 'blink.cmp'
    --   ---@type blink.cmp.Config
    --   opts = {
    --    keymap = { preset = 'default' },
    --     appearance = {
    --       use_nvim_cmp_as_default = true,
    --       nerd_font_variant = 'mono'
    --     },
    --     sources = {
    --       default = { 'lsp', 'path', 'snippets', 'buffer' },
    --     },
    --   },
    --   opts_extend = { "sources.default" }
    -- }
})
