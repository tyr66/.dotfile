# dotfile

主要记录一些常用软件的设置,以及配置过程中的注意点。以便将来更好的迁移这些工具. 直接clone 该仓库到本地


<!-- vim-markdown-toc GFM -->

- [dotfile](#dotfile)
  - [关于在终端下无法访问github的解决方案](#关于在终端下无法访问github的解决方案)
  - [Neovim配置](#neovim配置)
    - [Neovim的安装](#neovim的安装)
    - [Nerd Font 的安装](#nerd-font-的安装)
    - [yarn 全局安装不生效的问题](#yarn-全局安装不生效的问题)
    - [tree-sitter executable not found 错误解决方案](#tree-sitter-executable-not-found-错误解决方案)
  - [输入法的切换问题](#输入法的切换问题)
  - [window terminal 下neovim 无法全屏的问题](#window-terminal-下neovim-无法全屏的问题)

<!-- vim-markdown-toc -->

## 关于在终端下无法访问github的解决方案

由于一些不可描述的原因在cn访问github常常会出现问题，这些问题通过使用vpn可以很好的解决。但是即使用了vpn,在终端下执行 git clone 命令也时常出现问题。出现这种问题的原因是vpn并没有代理git的流量. 此时可以通过设置git代理来解决该问题。

可以查考 [设置代理解决github被墙](https://zhuanlan.zhihu.com/p/481574024) 这篇问题来解决

*vpn的代理端口如果vpn软件没有直接显示的话,可以通过打开windows的`代理服务器设置`面板来查看*


## Neovim配置

### Neovim的安装

访问 https://github.com/neovim/neovim/wiki/Installing-Neovim 并根据对应的平台来进行安装. 如果是windows平台并且使用的是lua 来进行neovim的配置，那么安装之后需要设置 `$XDG_CONFIG_HOME` 和 `$XDG_DATA_HOME` 这两个环境变量。前者表示配置的具体路径 后者表示插件的安装地址. 随后打开neovim 执行`:checkhealth`命令检查各插件的状态是否正常

- 设置 `$XDG_CONFIG_HOME` 和 `$XDG_DATA_HOME` 这两个环境变量是为了避免系统盘的占用过高
- `$XDG_CONFIG_HOME` 环境变量的路径直接设置为该dotfile文件夹的路径 , `$XDG_DATA_HOME` 的路径不要指定为该dotfile的路径
- 注意这里的neovim使用的是 [lazy.neovim](https://github.com/folke/lazy.nvim) 而不是 `packager.nvim` 来进行插件管理所以打开后会进行对应的插件安装



### Nerd Font 的安装 

neovim 中的一些插件例如lualine状态栏，它需要你去安装Nerd Front 字体否侧状态栏的图标会显示不正常

### yarn 全局安装不生效的问题

yarn的是使用scoop 来进行安装的，安装之后发现环境变量中 yarn 的地址不正确，从而导致了使用yarn进行全局安装一些插件的时候无法生效 

可以参考 [yarn 全局命令不生效](https://blog.csdn.net/weixin_41643133/article/details/83829235)

### tree-sitter executable not found 错误解决方案

使用 `:checkhealth`命令进行环境检查的时候,tree-sitter插件报 `executable not found (parser generator, only needed for :TSInstallFromGrammar, not required for :TSInstall)`

- 解决方案
安装`tree-sitter-cli` 以及 `tree-sitter`
```
`npm install -g tree-sitter-cli`
`npm install -g tree-sitter`
```


##  输入法的切换问题

是否可以在进入 `normal` 模式的时候 将window的输入法切换到 英文,而当进入insert模式的时候则将输入法设置为英文,或者是上一次退出时的状态.

- 进入insert 模式设置英文输入法
    - 优点: 输入流程更加的固定, 比如在离开后继续工作不需要查看当前的输入法状态.
    - 缺点: 每次进行中文输入的是偶需要进行输入法切换
- 进入insert 模式时恢复之前的输入状态
    - 优点: 减少了输入法的切换次数
    - 缺点: 如果稍微分神可能会出现输入混乱的情况

两种方案理论上都可以进行全局设置, 不同点在于
- window 不支持 微软拼音 每次切换的时候强制使用英文输入,它会记住上一次的输入模式,要使用方案一 就必须找到每次进入微软拼音时强制使用英文模式的方法

d看
[如何让微软拼音中文输入时使用英文标点](https://answers.microsoft.com/zh-hans/windows/forum/all/win10%E8%87%AA%E5%B8%A6%E8%BE%93%E5%85%A5%E6%B3%95/319ad549-1bdb-48aa-a9fe-83a18e9b82f6)


## window terminal 下neovim 无法全屏的问题
参考一下两个链接,这实际上并不是neovim的问题.而是window terminal 的问题
- [there are still white spaces on the right side of the windows while padding is set to 0](https://github.com/microsoft/terminal/issues/12069)
- [vim 在图形环境下产生黑边的问题](https://www.cnblogs.com/zhuxiaoxi/p/8536456.html)