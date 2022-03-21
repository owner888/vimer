#!/bin/bash
#
# tumx启动脚本
# mushan 2016-05-20
#命令行卡住解决办法 sudo killall -9 tmux

# 兼容zsh
export DISABLE_AUTO_TITLE="true"

#自动安装依赖


session="test"

sudo tmux has-session -t $session
if [ $? = 0 ];then
    tmux attach-session -t $session
    exit
fi


tmux new-session -d -s $session -n home

tmux new-window -t $session:0  

tmux send-keys -t $session:0 'htop' C-m

tmux split-window -t $session:0 -h
tmux send-keys -t $session:0 'sudo iotop --o' C-m

tmux split-window -t $session:0 -v
tmux send-keys -t $session:0 '~/soft/frp/run.sh' C-m

tmux split-window -t $session:0 -v
tmux send-keys -t $session:0  '
echo -e "\033[?25l" 

while true :
do
clear

 _STR=$(date "+%H:%M:%S")
 
 _HEIGHT=`echo $_STR | wc -c`
 _WIDTH=`echo $_STR | wc -L`
 
 _WINDOW_X=`tput lines`
 _WINDOW_Y=`tput cols`
 
 ALL_HEIGHT=`expr $_WINDOW_Y - $_HEIGHT`
 MARGIN_TOP=`expr $ALL_HEIGHT / 2`

 ALL_WIDTH=`expr $_WINDOW_X - $_WIDTH`
 MARGIN_LEFT=`expr $ALL_WIDTH / 2`

 tput cup $MARGIN_LEFT $MARGIN_TOP
 echo -n $_STR

sleep 1

done

' C-m

###关键在 echo 的 "-ne" 参数
### "-n" 表示不另起新行
### "-e" 表示格式化字符串里的\r \n等

tmux select-window -t $session:0
tmux attach-session -t $session
