local G = require('G')

G.map_to_key({
    -- coc 配置
    { 'i', '<TAB>', "coc#pum#visible() ? coc#pum#next(1) : col('.') == 1 || getline('.')[col('.') - 2] =~# '\\s' ? \"\\<TAB>\" : coc#refresh()", {silent = true, noremap = true, expr = true} }, -- 按下tab进行补全
    { 'n', '<F2>', '<Plug>(coc-rename)', {silent = true, desc = "coc-rename"} }, -- 按下 F2 进行重命名
    { 'n', 'gy', '<Plug>(coc-type-definition)', {silent = true, desc = "coc-type-definition"} },
    { 'n', 'gd', '<Plug>(coc-definition)', {silent = true, desc = "coc-definition"} },
    { 'n', 'gi', '<Plug>(coc-implementation)', {silent = true, desc = "coc-implementation"} },
    { 'n', 'gr', '<Plug>(coc-references)', {silent = true, desc = "coc-references"} },
    {'n', '<leader>tt', '<Plug>(coc-translator-p)', {desc = "coc-translator-p"}},
})

-- lsp
return{
    {
        'neoclide/coc.nvim', 

        branch = 'release',

        config = function()

            G.g.coc_global_extensions = {
                'coc-clangd',
                'coc-json',
                'coc-git',
                'coc-sumneko-lua',
                'coc-pairs', -- 括号补全
                'coc-snippets', -- 代码段补全
                'coc-floaterm', -- 显示出当前打开的所有 floaterm 终端
                'coc-translator', -- 翻译
                'coc-word', -- 单词补全
                'coc-todolist',

            }
        end

    },
}
