local G = require("G")
-- bufferline

return {
    'akinsho/bufferline.nvim',

    opts = {
        options = {
            -- 使用 nvim 内置lsp
            diagnostics = "nvim_lsp",
            -- 左侧让出 nvim-tree 的位置
            offsets = {{
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }}
        }
    },

    config = function(_, opts)
        G.g.termguicolors = true
        require("bufferline").setup(opts)
    end
}