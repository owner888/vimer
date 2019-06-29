" 在使用bundle安装插件之前，需要先安装vundle插件
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree 左侧目录树
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd VimEnter * NERDTree "启动Vim时自动打开nerdtree
let g:NERDTreeWinPos          = "left"
let g:NERDTreeWinSize         = 30
let g:NERDTreeShowLineNumbers = 0
"let g:NERDTreeQuitOnOpen     = 1
let g:NERDTreeMouseMode       = 1
let g:NERDChristmasTree       = 1
"let NERDTreeChDirMode        = 2 "打开书签时，自动将Vim的pwd设为打开的目录，如果你的项目有tags文件，你会发现这个命令很有帮助
map <C-\> <plug>NERDCommenterToggle  " 给批量注释设置快捷键

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{php}   set filetype=php
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"rkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!open %.html & <CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentLine 对齐线插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_term = 239
let g:indentLine_color_gui  = '#3F4039'
" 如果要保证此插件能够使用必须在vimrc中添加set expandtab
let g:indentLine_char       = '┆'  " 也可以不配置，indentLine.vim插件文件中有默认的
 
" 3.mru, 打开最近编辑过的文件
" 定义一个用逗号来表示<Learder>
let mapleader = "," 
let maplocalleader = "\\"
let MRU_Window_Height = 10

" 4.snipMate变量定义
let g:snips_author  = "seatle <seatle@foxmail.com>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocmd 自动加载
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType php setlocal dict+=~/.vim/funclist/swoole.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
" 太卡了，里面都不知道是什么函数来的
"au FileType go setlocal dict+=~/.vim/dict/go.dict
" 让html和smarty模板能调用字典
au FileType html,htm,smarty setlocal dict+=~/.vim/dict/css.dict
au FileType html,htm,smarty setlocal dict+=~/.vim/dict/javascript.dict
au FileType html,htm,smarty let g:javascript_enable_domhtmlcss = 1
au Filetype java setlocal omnifunc=javacomplete#Complete
" vim无法认出json，遇到json后缀的，告诉一下vim这个是json
au BufRead,BufNewFile *.json set filetype=json

" 新建文件模板, 创建一个skeletons目录
autocmd BufNewFile *.php 0r ~/.vim/skeletons/php.skel
autocmd BufNewFile *.go 0r ~/.vim/skeletons/go.skel
autocmd BufNewFile *.html 0r ~/.vim/skeletons/tpl.skel
autocmd BufNewFile *.tpl 0r ~/.vim/skeletons/tpl.skel
autocmd BufNewFile *.json 0r ~/.vim/skeletons/json.skel
autocmd BufNewFile *.java 0r ~/.vim/skeletons/java.skel

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => taglist 右侧的函数列表树
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set tags=./tags,./../tags,./**/tags,~/.vim/tags
" 在 .vimrc 里面已经配置了
" set tags=tags;
" set autochdir

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1 " 当taglist是最后一个分割窗口时，自动退出vim
let Tlist_File_Fold_Auto_Close = 1 " 非当前文件，函数列表折叠隐藏
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0 " 不是一直更新tags，因为没有必要
let Tlist_Show_Menu = 1 
let Tlist_Show_One_File = 1 " 让taglist 可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1 " 改成右边显示
let Tlist_WinWidth = 30
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabular 文本对齐
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 比如
" $a = 100;
" $b   = 100; 
" 你可以选择根据=号对齐, 用法: Tab/=, 也可以选择根据别的方式对齐

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => zencoding 代码块，后面改名为 emmet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neocomplacache 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭AutoComplPop，会和neocomplcache有冲突
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_disable_auto_complete = 0 " 设置NeoComplCache自动弹出补全列表
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1 " 支持智能匹配
let g:neocomplcache_enable_camel_case_completion = 1 " 支持驼峰格式匹配关键词
let g:neocomplcache_enable_underbar_completion = 1 " 支持下划线分割的关键词
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_enable_ignore_case = 1 " 支持忽略匹配
let g:neocomplcache_lock_buffer_name_pattern = '/*ku/*'
let g:neocomplcache_max_list = 20 " 下拉列表个数
let g:neocomplcache_enable_auto_select = 1 "支持在下拉框自动选择第一个
" let g:neocomplcache_enable_auto_delimiter = 1 " 分隔符
" let g:neocomplcache_enable_wildcard = 1 " 通配符
" let g:neocomplcache_enable_caching_message=1 "显示启动进度

" 跳过tpl，html 文件的语法检查，插件syntastic的配置
let g:syntastic_ignore_files=['.*\.tpl$', '.*\.html$']

"""YouCompleteMe智能补全工具
""let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
""" 不显示开启vim时检查ycm_extra_conf文件的信息
""let g:ycm_confirm_extra_conf = 0
""" 开启基于tag的补全，可以在这之后添加需要的标签路径
""let g:ycm_collect_identifiers_from_tags_files = 1
""" 开启语义补全
""let g:ycm_seed_identifiers_with_syntax = 1
"""注释和字符串中的文字也会被收入补全
""let g:ycm_collect_identifiers_from_comments_and_strings = 0
""" 输入第 2 个字符开始补全
""let g:ycm_min_num_of_chars_for_completion= 2
""" 禁止缓存匹配项,每次都重新生成匹配项
""let g:ycm_cache_omnifunc=0
"""在注释输入中也能补全
""let g:ycm_complete_in_comments = 1
"""在字符串输入中也能补全
""let g:ycm_complete_in_strings = 1
"""定义快捷健补全
""let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
""let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
""" 设置在下面几种格式的文件上屏蔽ycm
""let g:ycm_filetype_blacklist = {
""      \ 'tagbar' : 1,
""      \ 'qf' : 1,
""      \ 'notes' : 1,
""      \ 'markdown' : 1,
""      \ 'unite' : 1,
""      \ 'text' : 1,
""      \ 'vimwiki' : 1,
""      \ 'pandoc' : 1,
""      \ 'infolog' : 1,
""      \ 'mail' : 1
""      \}
"""设置关健字触发补全
""let g:ycm_semantic_triggers =  {
""  \   'c' : ['->', '.', ' ', '(', '[', '&'],
""  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
""  \             're!\[.*\]\s'],
""  \   'ocaml' : ['.', '#'],
""  \   'cpp,objcpp' : ['->', '.', '::'],
""  \   'perl' : ['->'],
""  \   'php' : ['->', '::'],
""  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
""  \   'ruby' : ['.', '::'],
""  \   'lua' : ['.', ':'],
""  \   'erlang' : [':'],
""  \ }
""let g:ycm_cache_omnifunc = 1
""let g:ycm_use_ultisnips_completer = 1
"""定义函数跟踪快捷健
""nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

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

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"let g:flutter_command = ''
let g:flutter_hot_reload_on_save = 1

let delimitMate_expand_cr = 1
