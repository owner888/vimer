" 指定插件vundle安装目录, vundle会指定其他插件安装目录
set rtp+=~/.vim/bundle/vundle/
" 调用管理器
call vundle#rc()

" 插件目录
" 左边树tree 
Bundle 'anscoral/nerdtree.vim'
" 对齐线
Bundle 'vim-scripts/indentLine.vim'
" 打开历史目录 => ,,m 
Bundle 'https://github.com/owner888/vimer/tree/master/bundle/mru.vim'
" 插件管理器
Bundle 'gmarik/vundle'
" 快捷补全
Bundle 'vim-scripts/snipMate'
" dict的补全 
Bundle 'vim-scripts/Pydiction'
" Bundle 'vim-scripts/php-doc' 重写过了，不用在更新
" 右边树, 显示函数列表等
Bundle 'vim-scripts/taglist.vim'
" 自动提示需要这2个插件, 并不用配置
" tree家族出的多行注释
Bundle 'vimscripts-song/nerdcommenter'
" c++的补全
" Bundle 'vim-scripts/OmniCppComplete'
" 弹框插件
" Bundle 'vim-scripts/neocomplcache'
" gdb vim调试工具, 据大神说很牛逼, 还不会用??????
Bundle 'badeip/gdb.vim'
" 文本对齐插件，你可以根据自己的喜欢来设置根据什么对齐比如=号
Bundle 'godlygeek/tabular'
" java提示, 
Bundle 'vim-scripts/javacomplete'
" 生成文本直接生成html，不 知道怎么用, 不过已经配了 
Bundle 'plasticboy/vim-markdown'
" html，xml等页面批量生成table等  
Bundle 'mattn/emmet-vim'
" 保存时语法检查, b不用配置
Bundle 'scrooloose/syntastic'

Bundle 'Valloric/YouCompleteMe'
