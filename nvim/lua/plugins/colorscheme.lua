-- 颜色主题配置
local G = require('G')


return {
    {
        "folke/tokyonight.nvim",

        opts = { 
            style = "moon",
             transparent = true
        },

        lazy = true,

    },

    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
    }
}

