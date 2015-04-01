# vim_conf
我的 .vim 和 .vimrc 文件

因为我实在太喜欢折腾了. 所以还是记录下历史记录
# 文件说明
- .vim 一看就知道
- .vimrc 一看就知道
- install.sh 安装脚本. mac 下默认没有 realpath 无法使用
- .vim/bundle/clone_git.sh 安装需要的 git 库

# change log
* python 的 F3 改为 PymodeLint,因为保存的时候不一定能正确触发检查.
* 一些文件不需要在 nerdtree 里面显示
* 把 vim 的 tmp 放到.vim里面,避免污染`~/`目录
