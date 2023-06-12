-- 浮动终端
local G = require("G")

return{
    'voldikss/vim-floaterm',

    cmd = "FloatermNew",

    config = function()
        -- 使用lua语法 G.floaterm_shell = 'powershell' 无法生效
        G.exec("let g:floaterm_shell = 'powershell'")

        -- floaterm 的外观配置
        G.cmd('hi Floaterm guibg=black')
        G.cmd('hi FloatermNC guifg=gray')
        G.cmd('hi FloatermBorder guibg=orange guifg=cyan')
    end
}