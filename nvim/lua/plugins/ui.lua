-- ui类型的插件
return {

    { "MunifTanjim/nui.nvim", lazy = true },

    -- 背景透明化
    {
        "xiyaowong/nvim-transparent",

        cmd = {"TransparentOpen", "TransparentToggle"},

        lazy = true,

        opts = {

            enable = false,
            extra_groups  = 'all'

        },

        config = function(_, opts)
            require('transparent').setup(opts)
        end
    },


}
