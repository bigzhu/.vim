# vim_conf
我的 .vim 和 .vimrc 文件

因为我实在太喜欢折腾了. 所以还是记录下历史记录
# 文件说明
- 直接把项目 clone 到 ~/ 目录下 
- install.sh 安装脚本, 仅仅是建立软链接到 ~/ 下, ~~mac 下默认没有 realpath 无法使用~~ 就是建立个软链接到~/下
- .vim/bundle/clone_git.sh 安装需要的 git 库

# change log
* 改为vimwiki下，光标在单词上, 空格可以查看单词意思
* vimwiki下，复制单词后，按F7可以查看单词意思
* python 的 F3 改为 PymodeLint,因为保存的时候不一定能正确触发检查.
* 一些文件不需要在 nerdtree 里面显示
* 把 vim 的 tmp 放到.vim里面,避免污染`~/`目录
