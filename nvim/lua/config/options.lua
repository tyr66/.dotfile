local G = require('G')
local opt = G.opt
-- 行号
-- opt.relativenumber = true
opt.number = true

-- 缩进对齐
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
--opt.shiftwidth = 4
opt.smarttab = true
opt.expandtab = true

-- 光标行
opt.cursorline = true
opt.lazyredraw = true
--opt.spellcheck = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
-- opt.splitright = true
-- opt.splitbelow = true

-- 搜索
opt.hlsearch = true
opt.showmatch = true
opt.incsearch = true
opt.inccommand = ''
opt.ignorecase = true
opt.smartcase = true
opt.timeoutlen = 400

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"


-- 防止中文乱码
opt.fileencodings = {"utf-8","gb2312","gb18030","gbk","ucs-bom","cp936","latin1"}
opt.enc = "utf8"
opt.fencs = {"utf8", "gbk", "gb2312", "gb18030"} 
opt.encoding = "utf-8"

opt.cmdheight = 0 
opt.undofile = true -- 撤销持久化,使得关闭文件后再打开还可以撤销上此的操作.
opt.undodir = 'd:\\nvim-win64\\undo\\' -- undofile 的保存位置

opt.showmatch = true -- 当光标位于括号时,高亮与其匹配的括号

-- opt.scrolloff = 5

-- HACK: for windows
-- 在window下在所在单词下按下K键会进行手册查询 模式该命令是使用man来查询但在windos下会报错,这里改为使用:help  https://www.reddit.com/r/neovim/comments/wwwrxl/problem_with_neovim_on_windows_10/
opt.keywordprg = ':help' 

-- 为 coc.nvim 设置 python2 he  python3 ,请确保python2，3都已经安装
G.g.python_host_prog = "E:\\Python\\python2\\python.exe"
G.g.python3_host_prog = "E:\\Python\\python3\\python.exe"

-- HACK: for windows
-- 默认nvim 进入 terminal model 时使用的terminal 是 cmd 这里 将其改为 powershell
-- https://stackoverflow.com/questions/36108950/setting-up-powershell-as-vims-shell-command-does-not-seem-to-be-passed-correct
opt.shell = 'powershell'
opt.shellcmdflag = '-command'
opt.shellquote = "\""
opt.shellxquote = ''


