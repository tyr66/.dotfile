-- 设置全局的工具函数供其他lua脚本使用
local G = {}

G.g = vim.g
G.b = vim.b
G.o = vim.o
G.v = vim.v
G.fn = vim.fn
G.api = vim.api
G.opt = vim.opt
G.wo = vim.wo

-- 按键映射 , 使用了 nvim_set_keymap函数
function G.map_to_key(maps)
    for _,map in pairs(maps) do
        vim.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
    end
end

function G.map_to_cmd(maps)
    for _,map in pairs(maps) do 
        vim.g.mapset(map[1], map[2], map[3])
    end
end


function G.hi(hls)
    for group,color in pairs(hls) do
        local fg = color.fg and ' ctermfg=' .. color.fg or ' ctermfg=NONE'
        local bg = color.bg and ' ctermbg=' .. color.bg or ' ctermbg=NONE'
        local sp = color.sp and ' cterm=' .. color.sp or ''
        vim.api.nvim_command('highlight ' .. group .. fg .. bg .. sp)
    end
end

function G.cmd(cmd)
    vim.api.nvim_command(cmd)
end

-- 考虑到有些插件不支持lua 或者是对lua的支持不够好
-- warp了 nvim_command 和 nvim_exe 来执行一些vim script代码
-- 前者参数为一个 table 后者参数为 一个 string
function G.exec(c)
    vim.api.nvim_exec(c, false)
end

function G.eval(c)
    return vim.api.nvim_eval(c)
end

return G
