" 如果你还没有 ~/.vimrc 文件，可以运行下面的命令创建一个指向 ~/.vim/vimrc 的符号链接
" echo 'source ~/.vim/vimrc' > ~/.vimrc
" 显示键盘映射 :h keycodes
" vim 配置文件 
let s:darwin = has('mac')
let s:windows = has('win32') || has('win64')
let s:gui = has('gui_running')

" ──────────────────────────────────────────────
" macOS 系统日志屏蔽：防止 NSMachPort 等警告刷屏
" ──────────────────────────────────────────────
if has("mac") || has("macunix")
  " 关闭 Cocoa 层日志输出
  silent! let $NSUnbufferedIO = "YES"
  " 关闭 Objective-C Fork 安全检查（防止子线程触发异常）
  silent! let $OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES"
  " 禁止 CoreFoundation 和 Distributed Objects 输出调试日志
  silent! let $CFLogForceStdErr = "NO"
  silent! let $CFLogLevel = "0"
endif

" -----------------------------  管理器插件 plugged.vim --------------------------------
" vim-plug settings {{{
call plug#begin('~/.vim/plugged')
" markdown
Plug 'mzlogin/vim-markdown-toc'
Plug 'mzlogin/vim-kramdown-tab'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " 坑死了, 居然是引用 nvim 的
" paste image in markdown
" Plug 'ferrine/md-img-paste.vim'

Plug 'skywind3000/vim-terminal-help'

Plug 'kristijanhusak/vim-simple-notifications'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'dense-analysis/ale'                   " 语法检查，支持异步
Plug 'preservim/nerdcommenter'              " 快速注释/解开注释，按 ctrl + \
Plug 'rizzatti/dash.vim'                    " 调用Mac系统的Dash.app软件查看函数
Plug 'itchyny/lightline.vim'                " 状态栏美化
Plug 'mengelbrecht/lightline-bufferline'    " 标签栏美化
Plug 'Raimondi/delimitMate'                 " 自动补全引号(单引号/双引号/反引号)
" Plug 'jiangmiao/auto-pairs'               " 自动补全引号(单引号/双引号/反引号)
" Plug 'wakatime/vim-wakatime'              " 工作耗时等信息统计，可以到 https://wakatime.com/ 查看
" Plug 'kien/ctrlp.vim'                     " 文件查找, 可以搜索文件/buffer/mru/tag等等
" Plug 'lvht/mru'                           " 最近使用文件列表
" Plug 'dstein64/vim-startuptime'           " 插件消耗时间，执行 :StartupTime
" Plug 'Yggdroot/indentLine'                " 缩进线
Plug 'scrooloose/nerdtree'                " 显示目录树，按F2展开关闭
" Plug 'Xuyuanp/nerdtree-git-plugin'        " git status 效果                                                                                                                         
" Plug 'airblade/vim-gitgutter'             " git diff，显示哪一行修改、增加
" Plug 'majutsushi/tagbar'                  " 函数变量列表，依赖ctags，golang 依赖 gotags: go get -u github.com/jstemmer/gotags
Plug 'stephpy/vim-phpdoc'                   " 插入PHP函数、类文档块
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" If you have nodejs and yarn
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mattn/emmet-vim'                      " 自动补全HTML标签 ul>li 然后按ctrl+e
Plug 'ap/vim-css-color', { 'for': [ 'css', 'scss' ] }
Plug 'docunext/closetag.vim'                " 自动补全HTML结束标签
Plug 'junegunn/vim-easy-align'              " 快速进行对齐/格式化，同类型产品：tabular
" Plug 'maralla/completor.vim'
" Plug 'SirVer/ultisnips'                   " 代码块引擎，需要python支持
" Plug 'honza/vim-snippets'                 " 代码块集合，输入if然后按tab，就会出来if的代码片段
Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'
Plug 'fatih/vim-go'                         " 第一次需要安装 golang 开发环境，运行 :GoUpdateBinaries，golangci-lint 可以检查错误，但是要配合上面那个ale插件才可以显示错误
Plug 'rust-lang/rust.vim'

" java decompile
Plug 'mzlogin/vim-smali'

" php
Plug 'StanAngeloff/php.vim'

" vue
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

" Plug 'yegappan/lsp'

" if s:darwin
    " Plug 'ybian/smartim'
" endif

Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

Plug 'dhruvasagar/vim-testify'
" asciidoc
" Plug 'habamax/vim-asciidoctor'
" base64 encode / decode
" Plug 'equal-l2/vim-base64'
" Plug 'gilligan/vim-lldb'
" Plug 'idanarye/vim-vebugger'
Plug 'thaerkh/vim-workspace'

" Plug 'owner888/taglist.vim'               " 函数变量列表，依赖ctags，不支持golang
Plug 'owner888/snipMate'                    " 10年前的代码块引擎
Plug 'owner888/vim-swift-format'
Plug 'Shougo/neocomplcache.vim'
Plug 'github/copilot.vim'

" Plug 'owner888/agccomplete'
" Plug 'owner888/codeassistant.vim'
call plug#end()
" }}}

" 自动载入 vimrc 文件，使得我们对 vim 的定制立即生效，无需重启
autocmd! bufwritepost vimrc source %
autocmd! bufwritepost functions.vim source %

" 开启语法高亮
syntax enable
syntax on 
" plugin 开启支持插件，indent 开启语言缩进
filetype plugin indent on

" Python Setting {{{
" set pythondll=/opt/homebrew/Frameworks/Python.framework/Versions/3.10/Python
" set pythonhome=/opt/homebrew/Frameworks/Python.framework/Versions/3.10
" set pythonthreedll=/opt/homebrew/Frameworks/Python.framework/Versions/3.10/Python
" set pythonthreehome=/opt/homebrew/Frameworks/Python.framework/Versions/3.10
" }}}

" -----------------------------  vim 属性设置 --------------------------------
" vim settings {{{
set lazyredraw                      " 延迟重绘
set redrawtime=10000                " 重绘时间间隔
set nocompatible                    " 不兼容vi模式, 关掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 
set encoding=utf8					" 设置编码
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin1
set helplang=cn						" 显示中文帮助
set fileformats=unix                " 设置文件格式
set cc=120                          " 红线位置
set expandtab                       " 使用空格代替tab , 如果要使用indent插件一定要开启这个
set tabstop=4	                    " Tab键显示出来的宽度, 4个空格
set softtabstop=4                   " 换行缩进宽度，4个空格
set shiftwidth=4                    " 设定 << 和 >> 命令移动时的宽度为 4
set cindent                         " 开启C/C++风格缩进，:set paste 关闭缩进，nopaste打开
set smartindent                     " 智能对齐方式
set autoindent                      " 自动对齐
set breakindent                     " 换行自动对齐
set smarttab                        " 一次性删除多个空格, 只在行首用tab，其他地方的tab都用空格代替
set showmatch                       " 高亮显示匹配括号, 在输入括号时光标会短暂地跳到与之相匹配的括号处
set matchtime=2                     " 匹配括号高亮的时间（单位是十分之一秒）
set lbr                             " 智能换行
set wrap                            " wrap(弯曲),允许backspace和光标键跨越行边界(不建议), 自动换行, 可以按backspace可以自动到头了可以换行
set textwidth=0						" 总不自动换行, 它的简写set tw = xxx 表示文本宽度是多少自动换行(回车效果)
set number                          " 显示行号
set numberwidth=3                   " 行号宽度
set ruler                           " 显示标尺
set wildmode=list:longest,full      " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）, win下有用
set laststatus=2                    " 启动显示状态行(1),总是显示状态行(2) 
set noerrorbells                    " 不发出错误声音
set autoread                        " 当文件内容被其他编辑器改变时自动加载 
set completeopt=menuone,longest     " 打开文件类型检测, 加了这句才可以用智能补全, 弹出提示框
"set complete-=k complete+=k        " 设置自动完成的监听方式：尾部添加一个字母和清除一个字母，有了自动补全插件就不需要这个了，这个每敲一次键盘就要响应一次很烦
set nobackup                        " 禁止生成临时文件
set noswapfile                      " 不要生成swap文件, 简写 set nowb
set wildignore=.svn,.git,.swap      " 用于目录插件NERD_tree上，打开目录忽略这些文件
set tags=tags;                      " 开启tags，方便自动提示,以及搜索,必开 ,因为taglist(左边的函数列表插件)用的到
set bsdir=buffer                    " 用于目录插件上，打开目录为当前文件目录
set virtualedit=block,onemore       " 光标可以移动到没有写字的地方，比如空白处 
set t_vb=                           " 不使用响铃，不闪屏, 好像是光标移动到结束的地方不会响
set dy=lastline                     " 当文件太长时，打开不会显示@@符号的字样
set foldenable                      " 允许自动折叠
set foldmethod=marker               " 设置折叠的函数为marker， marker vi 自带
set foldcolumn=0                    " 设置折叠的宽度, 就是折叠之后到底显示几行
setlocal foldlevel=10               " 折叠层级, 最多最外层这贴包含多少个折叠
set confirm                         " 在处理未保护或只读文件的时候，弹出确认
set smartcase                       " 如果使用插件搜索补全的时候，有相同的不要覆盖,都搜索出来 
set history=100                     " 历史记录数, 针对Mru插件显示最近100条打开的文件
set pumheight=30                    " 智能提示框层的高度
set cinoptions=:0,l1,g0,t0,(0,(s	" c语言语法的自动缩进
set magic                           " 选择括号自动匹对闭合的括号
set showtabline=2					" 显示tab显示框,默认也是开的
"set backupcopy=yes                 " 备份的同名文件进行覆盖, 前提是需要开启备份缓存swap
"set clipboard^=unnamed,unnamedplus " unnamedplus 用于解决Linux下系统剪切板无法通过 p 键粘贴到 vim 中
"set guioptions=''                  " 无菜单、无工具 go=guioptions
"set guioptions-=m                  " 不显示工具条
"set guioptions-=T                  " 不显示工具条
"set guioptions+=b                  " 显示横向滚动条
"set guitablabel=%N:\ %f            " tab完全显示路径名
"set cmdheight=2                    " 命令行（在状态行下）的高度，默认为1，这里是2
"set report=0                       " 通过使用: commands命令，告诉我们文件的哪一行被改变过
"set shortmess=atI                  " 启动的时候不显示那个援助索马里儿童的提示

" 搜索
set incsearch                       " 当vi中查找的时候从键入时就开始匹配
set hlsearch                        " 高亮搜索结果
set ignorecase                      " 搜索时不区分大小写，如果键入了大写字母则区分大小写 

" 撤销配置，在vim新版, 才有用
set undodir=~/tmp/                  " 撤销缓存目录
set undofile                        " 撤销文件, 当关闭文件之后，重新打开还可以无限撤销到最原始的文件

set background=dark                 " 有的样式支持两种模式：light、dark，比如gruvbox

"set ttymouse=xterm2
" }}}

au FileType go set noexpandtab    " Go 使用 Tab 而不是 4 个空格

" -----------------------------  主题鼠标设置 --------------------------------
if has("gui_running") 
    if !has('nvim')
        " 修改字体和大小                                                                  
        set gfn=Monaco:h10
        " 取消默认的快捷键
        "let macvim_skip_cmd_opt_movement = 1
        "let macvim_hig_shift_movement = 1
        "设置背景透明度
        set transparency=1
    endif

    "set guioptions-=e      " 不显示原生 Tab，这样 lightline-bufferline 才可以发挥效果

    set termguicolors       " enable true colors support
    let ayucolor="light"    " for light version of theme
    let ayucolor="mirage"   " for mirage version of theme
    let ayucolor="dark"     " for dark version of theme
    colorscheme molokai	    " 设置颜色方案：molokai、ayu、gruvbox、solarized8
    set linespace=3     	" 行间距
    set columns=220    		" 初始窗口的宽度
    set lines=50       		" 初始窗口的高度
    au FileType php,python,c,java,javascript,html,htm,smarty,json setl cursorline   " 高亮当前行
    au FileType php,python,c,java,javascript,html,htm,smarty,json setl cursorcolumn " 高亮当前列
else
    set mouse=a
    set t_Co=256       		" 让终端支持256色，否则很多配色不会正常显示，molokai就是其中之一
    colorscheme gruvbox 	" 设置颜色方案：molokai、gruvbox、solarized8
    hi Pmenu ctermbg=black  " 终端时的背景颜色
    hi PmenuSel ctermfg=0 ctermbg=lightblue " 当在终端使用时，弹出提示框内的文本的高亮的颜色

    if !has('nvim') && has('mac') " 非macOS说明是在Linux命令行模式下，不能去设置初始窗口的宽度和高度，否则样式会乱了
        set linespace=3
        set columns=230
        set lines=55
    endif
endif

" -----------------------------  单元测试 --------------------------------
" 用法：TestifyNearest、TestifySuite、TestifyLast、TestifyFile
" 要测试某个片段，停留再上面然后执行 :TestifyNearest
" Success Call
function! s:TestFunctionOk()
    call testify#assert#equals(1, 1)
    call testify#assert#not_equals(1, 2)
endfunction
call testify#it('Test should pass', function('s:TestFunctionOk'))

" Failed Call
function! s:TestFunctionNotOk()
    call testify#assert#equals(1, 2)
endfunction
call testify#it('Test should fail', function('s:TestFunctionNotOk'))

" 引用自定义函数
source ~/.vim/config/functions.vim
" 引用插件配置
source ~/.vim/config/plug.vim
" 引用快捷键配置
source ~/.vim/config/keyboard.vim

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:log_file = '/tmp/vim.log'

" 日志函数
function! Log(msg)
  let time = strftime('%Y-%m-%d %H:%M:%S')
  let log_line = "[" . time . "] " . a:msg
  " 追加写入文件
  call writefile([log_line], g:log_file, 'a')
endfunction

" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

