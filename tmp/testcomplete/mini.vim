" vim -u mini.vim test.php                                                                          
set nocompatible
set runtimepath^=~/.vim/plugged/molokai
set runtimepath^=~/.vim/plugged/molokai

" 下面两个冲突
"set runtimepath^=~/.config/nvim/plugged/coc.nvim
"set runtimepath^=~/.config/nvim/plugged/vim-snippets
"imap <expr> <c-f> coc#_select_confirm()

filetype plugin indent on
syntax on
set completeopt=menuone,longest

autocmd FileType php set omnifunc=phpcomplete#Complete

" 如果发现补全完毕之后提示窗口没有自动关闭，就加上下面这两行
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 启用增强模式的命令行补全。在命令行中输入命令时，按下'wildchar'键（默认为Tab）将自动补全命令和参数：此时将在命令行的上方显示可能的匹配项；继续按下'wildchar'键，可以遍历所有的匹配项；也可以使用方向键或者CTRL-P/CTRL-N键，在匹配列表中进行移动；最后点击回车键，选择需要的匹配项。
set wildmenu
set hidden
colorscheme molokai

" Popup item list
let s:popupItemResultList = []

noremap <F4> EchoMethod()<CR>
func! EchoMethod()
    echo 'hello world'
endfunc

inoremap <F5> <C-R>=ListMonths()<CR>

func! ListMonths()
    call complete(col('.'), ['January', 'February', 'March',
        \ 'April', 'May', 'June', 'July', 'August', 'September',
        \ 'October', 'November', 'December'])
    return ''
endfunc

