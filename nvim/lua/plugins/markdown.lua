local G = require('G')

-- markdown 相关插件
return {
    {
        'mzlogin/vim-markdown-toc', 
        ft = 'markdown'
    },

    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && yarn install',
        cmd = 'MarkdownPreview',
        ft = 'markdown',
        config = function()
            G.g.mkdp_page_title = '${name}'
            G.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
            G.g.mkdp_theme = 'light'
            G.g.vmt_fence_text = 'markdown-toc'
        end

    }
}