local G = require("G")

G.g.mapleader = " "

G.map_to_key({

    -- ---------- 正常模式 ---------- ---
    {"n", "<leader>sv", "<C-w>v", {}},-- 水平新增窗口 
    {"n", "<leader>sh", "<C-w>s", {}},-- 垂直新增窗口

    {"n", "<leader>nh", ":nohl<CR>", {}}, -- 取消高亮


    -- ---------- 插入模式 ---------- ---
    {"i", "jk", "<ESC>", {}},


    -- ---------- 视觉模式 ---------- ---
    -- 单行或多行移动
    {"v", "J", ":m '>+1<CR>gv=gv", {}},
    {"v", "K", ":m '<-2<CR>gv=gv", {}},

})