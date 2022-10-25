eval "$(/opt/homebrew/bin/brew shellenv)"

# oh my zsh 自带颜色
# export GREP_COLOR=auto
# export CLICOLOR='Yes'                       # 是否输出颜色
# export LS_OPTIONS='--color=auto'            # 如果没有指定，则自动选择颜色
# export LSCOLORS='GxFxCxDxBxegedabagaced'    # 指定颜色
# export WORDCHARS='*?[]~&;!$%^<>'

alias lls="ls -l | awk '{print $9}' | sort -k1.1n"
alias rmd="find . -type f -name \".DS_Store\"|xargs rm -rf"

export BREW=/opt/homebrew/opt

export PATH=$BREW/bin:$PATH
export PATH=$BREW/php@8.1/bin:$PATH
export PATH=$PATH:/opt/bin:/usr/local/bin
export PATH=$PATH:$HOME/.vim/bin
export PATH=$PATH:$HOME/Documents/gcam/tools
export PATH=$PATH:/Applications/MacVim.app/Contents/bin

# Sublime & VS Code
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin":$PATH
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH
# export PATH="/Applications/MacVim.app/Contents/bin":$PATH

# Golang
export GOROOT=$HOME/sdk/go1.19
export GOPATH=$HOME/Documents/golang
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/23.1.7779620
export PATH=$PATH:$ANDROID_HOME/build-tools/31.0.0
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=/Applications/Android\ Studio.app/Contents/jre/Contents/Home/bin:$PATH
export PATH=$HOME/.vim/support/gradle-classpath-1.2.0/bin:$PATH

# Flutter
export PATH=$PATH:$HOME/flutter/bin

# Python
export PATH=$PATH:$HOME/Library/Python/3.10/bin
export PYTHONPATH="$HOME/Documents/Git/Obfuscapk/src"

# GNU sed: brew install gnu-sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# brew install lazygit
alias lg=lazygit


alias proxy='export all_proxy=socks5://127.0.0.1:1080'
alias unproxy='unset all_proxy'

# proxy
function proxy_on() {
    export http_proxy="http://127.0.0.1:1087"
    export https_proxy=$http_proxy
    export no_proxy="localhost,127.0.0.1,0.0.0.0"
    echo -e "proxy on"
}
function proxy_off() {
    unset http_proxy
    unset https_proxy
    echo -e "proxy off"
}