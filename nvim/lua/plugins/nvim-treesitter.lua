-- 配置tree sitter 插件以及 rainbow插件
-- tree sitter 的基本概念可以参考 https://www.youtube.com/watch?v=LPXH7cBN_u8 以及 https://zhuanlan.zhihu.com/p/441818052

local G = require("G")


return {
        "nvim-treesitter/nvim-treesitter",

        build = ":TSUpdate",

        -- lazy load on event
        event = { "BufReadPost", "BufNewFile" },

        opts = {
            ensure_installed = { 
                "vim", "help", "bash", "c", "cpp", "javascript", "c_sharp", "json", "lua", "python", "typescript", "tsx", "css", "rust", "markdown", "markdown_inline" 
            }, -- one of "all" or a list of languages

            highlight = { enable = true },
            indent = { enable = true },

            context_commentstring = { enable = true, enable_autocmd = false },

            -- 不同括号颜色区分
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },

            -- tree sitter 的增量选择
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<TAB>",
                    node_decremental = "<BS>",
                },
            },
        },

        config = function(_, opts)
            G.wo.foldmethod = 'expr'
            G.wo.foldexpr = 'nvim_treesitter#foldexpr()'
            G.wo.foldlevel = 99
            require('nvim-treesitter.configs').setup(opts)
        end

}
