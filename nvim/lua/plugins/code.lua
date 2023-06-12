local G = require("G")

return {

    -- 多光标编辑
    {
        'mg979/vim-visual-multi', 

        branch = 'master',

        config = function()
            G.g.VM_theme = 'ocean'
            G.g.VM_highlight_matches = 'underline'
            G.g.VM_maps = {
                ['Find Under'] = '<C-n>',
                ['Find Subword Under'] = '<C-n>',
                ['Select All'] = '<C-d>',
                ['Select h'] = '<C-Left>',
                ['Select l'] = '<C-Right>',
                ['Add Cursor Up'] = '<C-Up>',
                ['Add Cursor Down'] = '<C-Down>',
                ['Add Cursor At Pos'] = '<C-x>',
                ['Add Cursor At Word'] = '<C-w>',
                ['Move Left'] = '<C-S-Left>',
                ['Move Right'] = '<C-S-Right>',
                -- ['Remove Region'] = 'q',
                ['Increase'] = '+',
                ['Decrease'] = '_',
                ["Undo"] = 'u',
                ["Redo"] = '<C-r>',
            }
        end
    },

    -- 两个光标移动插件 leaf 和 flit 的配置
    -- 其中 flit 需要leaf作为前置
    {
        'ggandor/leap.nvim',

        config = function()
            require('leap').add_default_mappings()

            -- 禁止立刻跳转到第一个匹配上
            require('leap').opts.safe_labels = {} 
        end
    },

    {
        'ggandor/flit.nvim',

        config = function()
            require('flit').setup {
            keys = { f = 'f', F = 'F', t = 't', T = 'T' },
            -- A string like "nv", "nvo", "o", etc.
            labeled_modes = "v",
            multiline = true,
            -- Like `leap`s similar argument (call-specific overrides).
            -- E.g.: opts = { equivalence_classes = {} }
            opts = {}
            }

        end
    },

    -- sourround
    {
        "kylechui/nvim-surround",

         version = '*',

         config = function()
            require('nvim-surround').setup()
         end
    }, 

    -- 注释插件
    {
        'numToStr/Comment.nvim',

        config = function()
            require('Comment').setup()
        end


    },
    -- todo 高亮
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',

        config = function()
            require('todo-comments').setup()
        end
    },

    -- word 高亮
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = { delay = 200 },
        config = function(_, opts)
            require("illuminate").configure(opts)
            -- vim.api.nvim_create_autocmd("FileType", {
            --     callback = function()
            --         local buffer = vim.api.nvim_get_current_buf()
            --         pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
            --         pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
            --     end,
            -- })
        end,
        -- stylua: ignore
        keys = {
            -- { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
            -- { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
        },
    },

    -- 显示缩进层级线
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- char = "▏",
            char = "│",
            filetype_exclude = { "help", "alpha", "dashboard", "nvim-tree", "Trouble", "lazy" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
    
    -- 更高价的文本替换工具
    {
        "windwp/nvim-spectre",
        -- stylua: ignore
        keys = {
            { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
        },
    },

    -- tmux移动
    {
        "christoomey/vim-tmux-navigator"
    },

}
