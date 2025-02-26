#!/usr/bin/env bash

# 前景色
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# 高亮前景色
bright_black=$(tput setaf 8)
bright_red=$(tput setaf 9)
bright_green=$(tput setaf 10)
bright_yellow=$(tput setaf 11)
bright_blue=$(tput setaf 12)
bright_magenta=$(tput setaf 13)
bright_cyan=$(tput setaf 14)
bright_white=$(tput setaf 15)

# 背景色
bg_black=$(tput setab 0)
bg_red=$(tput setab 1)
bg_green=$(tput setab 2)
bg_yellow=$(tput setab 3)
bg_blue=$(tput setab 4)
bg_magenta=$(tput setab 5)
bg_cyan=$(tput setab 6)
bg_white=$(tput setab 7)

# 高亮背景色
bg_bright_black=$(tput setab 8)
bg_bright_red=$(tput setab 9)
bg_bright_green=$(tput setab 10)
bg_bright_yellow=$(tput setab 11)
bg_bright_blue=$(tput setab 12)
bg_bright_magenta=$(tput setab 13)
bg_bright_cyan=$(tput setab 14)
bg_bright_white=$(tput setab 15)

# 文本样式
bold=$(tput bold)      # 加粗
dim=$(tput dim)        # 变暗
underline=$(tput smul) # 下划线
blink=$(tput blink)    # 闪烁
reverse=$(tput rev)    # 反色
hidden=$(tput invis)   # 隐藏

# 关闭样式
reset=$(tput sgr0)       # 重置所有样式
nounderline=$(tput rmul) # 关闭下划线
