eval "$(/opt/homebrew/bin/brew shellenv)"

# oh my zsh 自带颜色
# export GREP_COLOR=auto
# export CLICOLOR='Yes'                       # 是否输出颜色
# export LS_OPTIONS='--color=auto'            # 如果没有指定，则自动选择颜色
# export LSCOLORS='GxFxCxDxBxegedabagaced'    # 指定颜色
# export WORDCHARS='*?[]~&;!$%^<>'

# alias lss="ls -1 * | sort -n"
# alias lls="ls -l | awk '{print $9}' | sort -k1.1n"
alias lss="du -sh -- * | sort -rh" # 循环文件和文件夹，按大小排序
alias lls="ls -ld * |sort -n -k9"  # k9 是第9列, n是正序, nr是倒叙
alias rmds="find . -type f -name \".DS_Store\"|xargs rm -rf"
# alias rmds="find . -name \".DS_Store\" -depth -exec rm {} \;"
# alias python="python3"

export BREW=/opt/homebrew/opt

export PATH=$BREW/bin:$PATH
# export PATH=$BREW/php@8.1/bin:$PATH
export PATH=$PATH:/opt/bin:/usr/local/bin
export PATH=$PATH:$HOME/.vim/bin
export PATH=$PATH:$HOME/Development/GoogleCamera/gcam/tools

# Sublime & VS Code
export PATH=/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
export PATH=/Applications/Beyond\ Compare.app/Contents/MacOS:$PATH
# 修复 Leaderf 插件 ctags 报错
if ! command -v /opt/homebrew/bin/ctags >/dev/null 2>&1; then
    echo "universal-ctags not found. Installing..."
    brew install universal-ctags
fi
# 修复 ALE 插件 intelephense 报错
if ! command -v /opt/homebrew/bin/intelephense >/dev/null 2>&1; then
    echo "intelephense not found. Installing..."
    npm install -g intelephense
fi
export PATH="/Applications/MacVim.app/Contents/bin":$PATH

# Golang
export GOROOT=$HOME/sdk/go1.23
export GOPATH=$HOME/Development/golang
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/23.1.7779620
export PATH=$ANDROID_HOME/build-tools/33.0.2:$PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
# export PATH=$HOME/.vim/support/gradle-classpath-1.2.0/bin:$PATH

# Flutter
export PATH=$HOME/Development/flutter/bin:$PATH

# Python
# export PATH=$PATH:$HOME/Library/Python/3.10/bin
export PYTHONPATH="$HOME/Development/Git/Obfuscapk/src"

# GNU sed: brew install gnu-sed
export PATH="$BREW/gnu-sed/libexec/gnubin:$PATH"

# brew install lazygit
alias lg=lazygit
alias fixandroid="softwareupdate --install-rosetta --agree-to-license"


# proxy
alias proxy='export all_proxy=socks5://127.0.0.1:1080'
alias unproxy='unset all_proxy'

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

