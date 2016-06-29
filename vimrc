" vim 配置文件 --- yelei 

" 加载插件管理器插件 pathogen.vim 
call pathogen#infect()	

" 开启语法高亮
syntax enable
syntax on 

" 开启插件, 如果vim里面装了插件必须要开启此选项才可以用插件,
" 开启文件类型检测
filetype plugin indent on

" 自动载入_vimrc文件，使得我们对vim的定制立即生效，无需重启
autocmd! bufwritepost vimrc source %

" -----------------------------  vim 属性设置 --------------------------------
set nocompatible                    " 不兼容vi模式, 关掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限 
set encoding=utf8					" 设置编码
set termencoding=utf-8              " 设置编码
set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin1
set helplang=cn						" 显示中文帮助
set fileformats=unix                " 设置文件格式
set cc=100                          " 红线位置
"set transparency=10                " 设置背景透明度
set gfn=Monaco:h10 	                " 修改字体和大小                                                                  
set expandtab                       " 使用空格代替tab , 如果要使用indent插件一定要开启这个
"set noexpandtab                    " 不要用空格代替制表符, set expandtab 用空格代替制表符
set tabstop=4	                    " Tab键的宽度, 4个空格
set shiftwidth=4                    " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4                   " 统一缩进为4, 用4个空格代替1个tab
set cindent                         " 开启C/C++风格缩进，:set paste 关闭缩进，nopaste打开
set smartindent                     " 智能对齐方式
set autoindent                      " automatically indent new line, 自动对齐
set smarttab                        " 一次性删除多个空格, 只在行首用tab，其他地方的tab都用空格代替
set showmatch                       " 高亮显示匹配括号, 在输入括号时光标会短暂地跳到与之相匹配的括号处
set matchtime=2                     " 匹配括号高亮的时间（单位是十分之一秒）
set lbr                             " 智能换行
set wrap                            " wrap(弯曲),允许backspace和光标键跨越行边界(不建议), 自动换行, 可以按backspace可以自动到头了可以换行
set textwidth=0						" 总不自动换行, 它的简写set tw = xxx 表示文本宽度是多少自动换行(回车效果)
set number                          " 显示行号
set numberwidth=3                   " 行号宽度
"set showcmd                        " 输入的命令显示出来，看的清楚些 ，win有用 
set ruler                           " 显示标尺
"set wildmenu                       " 使回格键（backspace）正常处理indent, eol, start等 win有用
set wildmode=list:longest,full      " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）, win下有用
set laststatus=2                    " 启动显示状态行(1),总是显示状态行(2) 
"set mouse=a                        " 充许使用鼠标, 值对win有用
"set mousehide						" 隐藏鼠标，当是文本的处于编辑的时候, win有用
set noerrorbells                    " 不发出错误声音
set autoread                        " 当文件内容被其他编辑器改变时自动加载 
"set backspace=indent,eol,start     " 插入模式下允许回格键删除字符, win下有用
set completeopt=menuone,longest     " 打开文件类型检测, 加了这句才可以用智能补全, 弹出提示框
set nobackup                        " 禁止生成临时文件
set noswapfile                      " 不要生成swap文件, 简写 set nowb
"set whichwrap+=<,>,h,l             " 当光标到达行尾或者行首时，继续移动转至下一行或者上一行, win有用
set wildignore=.svn,.git,*.swp,*.bak,*~,*.o,*.a  " 用于目录插件NERD_tree上，打开目录忽略这些文件
set tags=tags;                      " 开启tags，方便自动提示,以及搜索,必开 ,因为taglist(左边的函数列表插件)用的到
set bsdir=buffer                    " 用于目录插件上，打开目录为当前文件目录
set autochdir                       " 用于目录插件上，比如taglist(函数列表插件)自动加载文件中的子目录（比如加载变量目录下面的所有变量）
set virtualedit=block,onemore       " 光标可以移动到没有写字的地方，比如空白处 
set t_vb=                           " 不使用响铃，不闪屏, 好像是光标移动到结束的地方不会响
set dy=lastline                     " 当文件太长时，打开不会显示@@符号的字样
" set fdm=indent                    " 代码折叠的格式
set foldenable                      " 允许自动折叠
set foldmethod=marker               " 设置折叠的函数为marker， markervi自带
set foldcolumn=0                    " 设置折叠的宽度, 就是折叠之后到底显示几行
setlocal foldlevel=10               " 折叠层级, 最多最外层这贴包含多少个折叠
"set ambiwidth=double               " 防止特殊符号无法正常显示, 这个开启之后会影响tab缩进, 并且插件indent中如果对齐符号改成'┆' 也要关闭这个tab建才不会有问题
set confirm                         " 在处理未保护或只读文件的时候，弹出确认
set smartcase                       " 如果使用插件搜索补全的时候，有相同的不要覆盖,都搜索出来 
" set scrolloff=3					" 保持光标跟窗口的边距为3，当光标移动到窗口边，就自动弹出3行出来
set history=100                     " 历史记录数, 针对Mru插件显示最近100条打开的文件
set pumheight=30                    " 智能提示框层的高度
set cinoptions=:0,l1,g0,t0,(0,(s	" c语言语法的自动缩进
set magic                           " 选择括号自动匹对闭合的括号
set showtabline=2					" 显示tab显示框,默认也是开的
"setlocal cursorline				" 高亮当前行 
"setlocal cursorcolumn				" 高亮当前列
" set backupcopy=yes                " 备份的同名文件进行覆盖, 前提是需要开启备份缓存swap
" set clipboard+=unnamed			" 在win下有可能QQ啥的的剪切到剪切板的数据没有办法copy到vim中,需要设置这个
" set linebreak						" 牛逼没搞清楚
" set hidden                        " 牛逼没搞清楚, enable multiple modified buffers
" set guioptions=''					" 无菜单、无工具 go=guioptions
" set guioptions-=m					" 不显示工具条
" set guioptions-=T					" 不显示工具条
" set guioptions+=b					" 显示横向滚动条
" set guitablabel=%N:\ %f			" tab完全显示路径名
" set iskeyword+=_,$,@,%,#,-        " 带有如下符号的单词不要被换行分割
" set cmdheight=2                   " 命令行（在状态行下）的高度，默认为1，这里是2
" set report=0                      " 通过使用: commands命令，告诉我们文件的哪一行被改变过
" set shortmess=atI                 " 启动的时候不显示那个援助索马里儿童的提示


" 鼠标点哪里，光标到哪里，针对6.3的gvim版本, 新版本不用	
"set selection=exclusive				
"set selection=inclusive 
"set selectmode=mouse,key

" 搜索
set incsearch                       " 当vi中查找的时候从键入时就开始匹配
set hlsearch                        " 高亮搜索结果
set ignorecase                      " 搜索时不区分大小写，如果键入了大写字母则区分大小写 

" 撤销配置，在vim新版, 才有用
set undodir=~/tmp/                  " 撤销缓存目录
set undofile                        " 撤销文件, 当关闭文件之后，重新打开还可以无限撤销到最原始的文件


" 根据是运行gvim 还是 在终端运行vim来判断使用哪个配色方案
if has("gui_macvim") || has("gui_running") 
    " 修改字体和大小                                                                  
    set gfn=Monaco:h10
    " 取消默认的快捷键
    "let macvim_skip_cmd_opt_movement = 1
    "let macvim_hig_shift_movement = 1
    "设置背景透明度
    "set transparency=10

	colorscheme molokai 	" 设置颜色方案, 配置方案的文件在.vim/colors中
	set linespace=3     	" 行间距
	set columns=180    		" 初始窗口的宽度
	set lines=35       		" 初始窗口的高度
    au FileType php,python,c,java,javascript,html,htm,smarty,json setl cursorline   " 高亮当前行
    au FileType php,python,c,java,javascript,html,htm,smarty,json setl cursorcolumn " 高亮当前列
else
	colorscheme molokai
	set t_Co=256       		" 让终端支持256色，否则很多配色不会正常显示，molokai就是其中之一
	set linespace=3
	set columns=180
	set lines=45
	" 终端时的背景颜色
	hi Pmenu ctermbg=black   
    " 当在终端使用时，弹出提示框内的文本的高亮的颜色 
    hi PmenuSel ctermfg=0 ctermbg=lightblue
endif

" 每次打开文件自动定位最后的编辑文件一行
set report=0	" 这个设置不设置在这个版本没关系
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


" 设置用窗口打开文件之后，窗口最下面显示文件的完整路径
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}/%h\ \ \ Line:\ %l/%L:%c
function! CurDir()
  let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
  return curdir
endfunction

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

" 把html文件当作xml文件来编辑，因为html按=号格式化有问题，而xml没问题
au FileType smarty,html set ft=xml 
au FileType smarty,html set syntax=html " 语法高亮还是用html自身的高亮
" xmledit
let xml_use_xhtml = 1

" 当编辑php文件的时候，导入PHP函数列表，按 ctrl+n 自动补全
"au FileType php call AddPHPFuncList() " 有neocomplacache都不用这些函数了，自带的
function! AddPHPFuncList()
  set dict-=~/.vim/php_funclist.txt dict+=~/.vim/php_funclist.txt
  set complete-=k complete+=k
endfunction

"引用插件配置
source ~/.vim/config/plug.vim
"引用快捷键配置
source ~/.vim/config/keyboard.vim

"Golang配置
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
