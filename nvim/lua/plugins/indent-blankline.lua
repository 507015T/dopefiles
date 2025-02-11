return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function ()
        require("ibl").setup(
                   {
           -- debounce = 100,
           indent = { char = "▏", tab_char = "·" },
            }
        )

    vim.cmd([[highlight clear LineNr]])
    end,
}

