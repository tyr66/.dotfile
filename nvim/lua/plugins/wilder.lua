-- 命令提示插件
-- wilder 提供的配置的中照抄过来的 [^1]
-- 我发现 wilder 处理对于 Man 命令的处理非常的慢，参考 [^2] 将其禁用。
--
-- [^1]: https://github.com/gelguy/wilder.nvim
-- [^2]: https://github.com/gelguy/wilder.nvim/issues/107

local G = require("G")

-- 按键配置
G.map_to_key({
    {'c', "<C-N>", "wilder#in_context()? wilder#next() : ''",{noremap = true, silent = true, expr = true}}, 
    {'c', "<C-P>", "wilder#in_context()? wilder#previous() : ''",{noremap = true, silent = true, expr = true}},
})


return {
    'gelguy/wilder.nvim',

    dependencies = {"romgrk/fzy-lua-native"},

    config = function()

        local wilder = require("wilder")

        wilder.setup({
            modes = {':'},
        })

        wilder.set_option('use_python_remote_plugin', 0)  -- 禁用掉 python_remote_plugin


        -- 这段代码必须使用 vimscript ，该插件对lua的支持不够完善
        G.exec([[
            call wilder#set_option('pipeline', [
            \   wilder#branch(
            \   [
            \     wilder#check({-> getcmdtype() ==# ':'}),
            \     {ctx, x -> wilder#cmdline#parse(x).cmd ==# 'Man' ? v:true : v:false},
            \   ],
            \     wilder#cmdline_pipeline({
            \       'fuzzy': 1,
            \       'fuzzy_filter': wilder#lua_fzy_filter(),
            \     }),
            \     wilder#vim_search_pipeline(),
            \   ),
            \ ])
        ]])


        -- 设置样式
        wilder.set_option('renderer', wilder.renderer_mux({
            [':'] = wilder.popupmenu_renderer({
                highlighter = wilder.lua_fzy_highlighter(),
                left = {
                    ' ',
                    wilder.popupmenu_devicons()
                },
                right = {
                    ' ',
                    wilder.popupmenu_scrollbar()
                },
            }),
        }))

        -- 设置提示栏边框样式
        wilder.set_option('renderer', wilder.popupmenu_renderer(
            -- highlighter applies highlighting to the candidates

            wilder.popupmenu_border_theme({
                highlights = {
                    border = 'Normal', -- highlight to use for the border
                },
                -- 'single', 'double', 'rounded' or 'solid'
                -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
                border = 'rounded',
            })
        ))
    end
}
