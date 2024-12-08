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
    {
      "nvim-tree/nvim-tree.lua",
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
    { 'neovim/nvim-lspconfig', },
    --------------------------
    -- Плагин для автокомплита
    {'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip'},
    --------------------------
    -- Плагин для отслеживания изменений git
    { "lewis6991/gitsigns.nvim", },
    --------------------------
    -- Плагин менеджер окон
    {'akinsho/bufferline.nvim', version = "*"},
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
    -- Плагин для комментирования
    -- { 'numToStr/Comment.nvim' },
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
    -- Плагин Obsidian
    -- {
    --   "epwalsh/obsidian.nvim",
    --   version = "*",
    --   lazy = true,
    --   ft = "markdown",
    -- },
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
      }
    },
    ----------------------
})
