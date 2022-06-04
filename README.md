# 前言
fork自skywind3000大佬的初始化配置库。


# 安装

将项目克隆到你喜欢的目录内，比如 `~/.vim` 内：

```bash
cd ~/.vim
git clone https://github.com/tmoonlight/vim-init.git
```

然后创建你的 `~/.vimrc` 文件，里面只有一句话：

```VimL
source ~/.vim/vim-init/init.vim
```

请调整你的终端软件，确保对 ALT 键的支持，以及 Backspace 键发送正确扫描码：

[终端软件下正确支持 ALT 键和 Backspace 键](https://github.com/skywind3000/vim-init/wiki/Setup-terminals-to-support-ALT-and-Backspace-correctly)

然后启动 Vim，在命令行运行 `:PlugInstall` 安装依赖插件即可。

## 安装插件
然后启动 Vim，在命令行运行 `:PlugInstall` 安装依赖插件即可。

## 手动安装YouCompleteMe 
##（从gitee下载YouCompleteMe，解决github下载慢的问题，已克隆YouCompleteMe的仓库及子模块到gitee上，2020年3月7日10:22:24）
```bash
sudo apt-get install cmake
sudo apt-get install python3-dev
cd ~/.vim/bundles
git clone https://gitee.com/zhuixixi/YouCompleteMe.git --depth=1
cd ~/.vim/bundles/YouCompleteMe
python3 install.py --clang-completer
```

## 安装插件需要的第三方工具
```bash
sudo apt-get install clang-format-6.0
sudo apt-get install silversearcher-ag ctags

// clang-format建软连接
cd /usr/bin
sudo ln -s clang-format-6.0 clang-format

## 以下两行添加到.vimrc以加载clang代码提示：
```VimL
let g:ycm_global_ycm_extra_conf = '~/.vim/vim-init/tools/conf/.ycm_extra_conf.py'

set runtimepath+=~/.vim/bundles/YouCompleteMe
```

# 结构

本配置按顺序，由如下几个主要模块组成：

- `init.vim`: 配置入口，设置 runtimepath 检测脚本路径，加载其他脚本。
- `init-basic.vim`: 所有人都能同意的基础配置，去除任何按键和样式定义，保证能用于 `tiny` 模式（没有 `+eval`）。
- `init-config.vim`: 支持 +eval 的非 tiny 配置，初始化 ALT 键支持，功能键键盘码，备份，终端兼容等
- `init-tabsize.vim`: 制表符宽度，是否展开空格等，因为个人差异太大，单独一个文件好更改。
- `init-plugin.vim`: 插件，使用 vim-plug，按照设定的插件分组进行配置。
- `init-style.vim`: 色彩主题，高亮优化，状态栏，更紧凑的标签栏文字等和显示相关的东西。
- `init-keymaps.vim`: 快捷键定义。

最好 fork 一份到你自己的仓库，然后不断修改，把它修改成你自己的东西，平时要更新时到这里同步下上游仓库，然后自己合并一下即可。

除去 vim-plug 额外安装的插件外，本配置自带一些依赖较大的[插件](https://github.com/skywind3000/vim-init/wiki/Integrated-Plugins)，保证内网连不了网的情况下，把本配置压缩包解压一下就能跑得起来，且基本功能可用，它们都比较简单，往往一两个文件，分布于 `plugin` 和 `autoload` 两个目录中，你可以根据自己需要增改。

# 帮助

既然是全中文注释，帮助主要看 [init-keymaps.vim](https://github.com/skywind3000/vim-init/blob/master/init/init-keymaps.vim) 和 [init-plugins.vim](https://github.com/skywind3000/vim-init/blob/master/init/init-plugins.vim) 两个文件，每个点我都写满了注释了，也是未来你自己可能修改的最多的两个文件。每次你修改或者调试了单个 .vim 配置文件后，命令行输入 `:so %` 即可重新载入，so 是 `source` 的简写，意思是加载脚本，`%` 代表当前正在编辑脚本的名字。

# Credit

TODO
