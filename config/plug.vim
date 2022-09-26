"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mru 打开最近编辑过的文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义一个用逗号来表示<Learder>
let mapleader = "," 
let maplocalleader = ",,"
let MRU_Window_Height = 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabline 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
" show only the filename
let g:lightline#bufferline#filename_modifier = ':t'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#composed_number_map = {
\ 1:  '1', 2:  '2', 3:  '3', 4:  '4', 5:  '5',
\ 6:  '6', 7:  '7', 8:  '8', 9:  '9', 10: '10',
\ 11: '11', 12: '12', 13: '13', 14: '14', 15: '15',
\ 16: '16', 17: '17', 18: '18', 19: '19', 20: '20'}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:mkdp_markdown_css = expand('~/custom-markdown.css')
" let g:mkdp_auto_start = 0
" let g:mkdp_auto_close = 1
" let g:mkdp_refresh_slow = 0
" let g:mkdp_command_for_global = 0
" let g:mkdp_open_to_the_world = 0
" let g:mkdp_preview_options = {
"     \ 'mkit': {},
"     \ 'katex': {},
"     \ 'uml': {},
"     \ 'maid': {},
"     \ 'disable_sync_scroll': 0,
"     \ 'sync_scroll_type': 'middle',
"     \ 'hide_yaml_meta': 1,
"     \ 'sequence_diagrams': {},
"     \ 'flowchart_diagrams': {},
"     \ 'content_editable': v:false,
"     \ 'disable_filename': 0,
"     \ 'toc': {}
"     \ }
" let g:mkdp_page_title = '「${name}」'
" let g:mkdp_filetypes = ['markdown']
" let g:mkdp_theme = 'dark'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 通过模板生成新建文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile *.php 0r ~/.vim/skeletons/php.skel
au BufNewFile *.go 0r ~/.vim/skeletons/go.skel
au BufNewFile *.html,*tpl 0r ~/.vim/skeletons/tpl.skel
au BufNewFile *.json 0r ~/.vim/skeletons/json.skel
au BufNewFile *.java 0r ~/.vim/skeletons/java.skel
au BufNewFile *.rust 0r ~/.vim/skeletons/rust.skel
au BufNewFile *.dart 0r ~/.vim/skeletons/dart.skel

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => leaderF 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 安装必备的工具
" brew install universal-ctags
" brew install ripgrep

let g:Lf_ShowDevIcons = 0   " 解决打开文件中文乱码
"let g:Lf_ReverseOrder = 1
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']    " 当前目录或者往上一级目录查找，找到就当作 root 目录
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShortcutB = '<C-L>'
nnoremap <C-F> :LeaderfFunction<CR>
nnoremap <C-M> :Leaderf mru<CR>
nnoremap <C-N> :Leaderf rg<CR>
"文件搜索
nnoremap <silent> <Leader>F :Leaderf file<CR>
"历史打开过的文件
nnoremap <silent> <Leader>m :Leaderf mru<CR>
"Buffer
nnoremap <silent> <Leader>b :Leaderf buffer<CR>
"函数搜索（仅当前文件里）
nnoremap <silent> <Leader>f :Leaderf function<CR>
"模糊搜索，很强大的功能，迅速秒搜
nnoremap <silent> <Leader>rg :Leaderf rg<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto-pairs 自动配对 ''、""、()、[]、{}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:AutoPairsShortcutToggle = '<leader>p'
"let g:AutoPairsShortcutJump = ''
"let g:AutoPairsMapSpace = 0
"let g:AutoPairsMultilineClose = 0
"let g:AutoPairsMapBS = 0
"autocmd FileType c,cpp let b:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
"autocmd FileType smali let b:AutoPairs = {'(':')', '{':'}',"'":"'",'"':'"', '`':'`'}
"if s:gui && s:darwin
    "let g:AutoPairsShortcutFastWrap = '<D-r>'
"else
    "let g:AutoPairsShortcutFastWrap = '<M-r>'
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree 左侧目录树
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd VimEnter * NERDTree                " 启动Vim时自动打开nerdtree
let NERDTreeShowBookmarks     = 1           " 默认显示书签
let g:NERDTreeWinPos          = "left"
let g:NERDTreeWinSize         = 30
let g:NERDTreeShowLineNumbers = 0
"let g:NERDTreeQuitOnOpen     = 1
let g:NERDTreeMouseMode       = 1
let g:NERDChristmasTree       = 1
"let NERDTreeChDirMode        = 2            " 打开书签时，自动将Vim的pwd设为打开的目录，如果你的项目有tags文件，你会发现这个命令很有帮助
"let g:NERDTreeIgnore = ['\~$', '\.pyc$', '\.class$']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERD Commenter 代码注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 默认情况下，在注释分隔符后添加空格
let g:NERDSpaceDelims = 1
" 对美化的多行注释使用压缩语法(貌似这个没什么卵用)
let g:NERDCompactSexyComs = 1
" 按行对齐注释分隔符左对齐，而不是按代码缩进
let g:NERDDefaultAlign = 'left'
" 默认情况下，将语言设置为使用其备用分隔符（不是很明白所以忽略）
let g:NERDAltDelims_java = 1
" 添加您自己的自定义格式或覆盖默认格式（你懂的）
let g:NERDCustomDelimiters = { 'smali': { 'left': '#' }, 'java': { 'left': '//' } }
" 允许注释和反转空行（在注释区域时很有用） （没亲测）
let g:NERDCommentEmptyLines = 1
" 取消注释时启用尾随空白的修剪
let g:NERDTrimTrailingWhitespace = 1
" 启用 NERDCommenterToggle 检查是否对所有选定行进行了注释
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => leafOfTree/vim-vue-plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript', 'typescript'],
      \   'style': ['css', 'scss', 'sass', 'less', 'stylus'],
      \   'i18n': ['json', 'yaml'],
      \   'route': 'json',
      \},
      \'full_syntax': ['json'],
      \'initial_indent': ['i18n', 'i18n.json', 'yaml'],
      \'attribute': 1,
      \'keyword': 1,
      \'foldexpr': 0,
      \'debug': 0,
      \}

function! OnChangeVueSyntax(syntax)
    echom 'Syntax is '.a:syntax
    if a:syntax == 'html'
        setlocal commentstring=<!--%s-->
        setlocal comments=s:<!--,m:\ \ \ \ ,e:-->
    elseif a:syntax =~ 'css'
        setlocal comments=s1:/*,mb:*,ex:*/ commentstring&
    else
        setlocal commentstring=//%s
        setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar 右侧的函数列表树
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar {{{
let g:tagbar_ctags_bin="/opt/homebrew/bin/ctags"
" 宽度
let g:tagbar_width = 30
" 是否显示在左边，默认在右边
"let g:tagbar_left = 1
" 标签不排序
let g:tagbar_sort = 0
let g:tagbar_show_visibility = 0
let g:airline#extensions#tagbar#enabled = 0

" Smali配置
let g:tagbar_type_smali = {
        \ 'ctagstype' : 'smali',
        \ 'kinds' : [
                \ 'f:field',
                \ 'm:method',
        \ ]
\ }

" Golang配置，ctagsbin 使用 gotags，brew install gotags
let g:tagbar_type_go = {
   \ 'ctagstype' : 'go',
   \ 'ctagsbin'  : 'gotags',
   \ 'ctagsargs' : '-sort -silent',
   \ 'kinds'     : [
       \ 'p:package',
       \ 'i:imports:1',
       \ 'n:interfaces',
       \ 't:types',
       \ 'f:functions'
   \ ],
   \ 'sro'       : '.',
   \ 'kind2scope' : {
       \ 't' : 'ctype',
       \ 'n' : 'ntype'
    \ },
   \ 'scope2king' : {
       \ 'ctype' : 't',
       \ 'ntype' : 'n'
    \ }
\ }

" PHP配置
if !exists('g:tagbar_phpctags_bin')
    if executable(expand("<sfile>:p:h").'/../phpctags/phpctags')
        let g:tagbar_phpctags_bin = expand("<sfile>:p:h").'/../phpctags/phpctags'
    elseif executable(expand("<sfile>:p:h").'/../bin/phpctags')
        let g:tagbar_phpctags_bin = expand("<sfile>:p:h").'/../bin/phpctags'
    elseif executable(expand("<sfile>:p:h").'/../phpctags')
        let g:tagbar_phpctags_bin = expand("<sfile>:p:h").'/../phpctags'
    else
        let g:tagbar_phpctags_bin = 'phpctags'
    endif
endif

if !exists('g:tagbar_phpctags_memory_limit')
    let g:tagbar_phpctags_memory_limit = '128M'
endif

let g:tagbar_type_php = {
    \ 'ctagsbin'  : tagbar_phpctags_bin,
    \ 'ctagsargs' : '--memory="' . tagbar_phpctags_memory_limit . '" -f -',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 't:Traits:0',
        \ 'n:interfaces',
        \ 'c:classes',
        \ 'm:Methods:1',
        \ 'f:functions'
    \ ],
    \ 'sro'        : '::',
    \ 'kind2scope' : {
        \ 'c' : 'class',
        \ 'm' : 'method',
        \ 'f' : 'function',
        \ 'i' : 'interface',
        \ 'n' : 'namespace',
        \ 't' : 'trait',
    \ },
    \ 'scope2kind' : {
        \ 'class'     : 'c',
        \ 'method'    : 'm',
        \ 'function'  : 'f',
        \ 'interface' : 'i',
        \ 'namespace' : 'n',
        \ 'trait'     : 't',
    \ }
\ }
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => taglist 右侧的函数列表树
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set tags=./tags,./../tags,./**/tags,~/.vim/tags
" 在 .vimrc 里面已经配置了
" set tags=tags;
let Tlist_Ctags_Cmd="ctags"
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0             " 是否显示函数参数
let Tlist_Display_Tag_Scope = 0             " 是否显示完全命名空间
let Tlist_Enable_Fold_Column = 0            " 是否允许折叠柱
let Tlist_Exit_OnlyWindow = 1               " 当taglist是最后一个分割窗口时，是否自动退出vim
let Tlist_File_Fold_Auto_Close = 1          " 非当前文件，函数列表折叠隐藏
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30               " 最大标签长度
let Tlist_Process_File_Always = 0           " 不是一直更新tags，因为没有必要
let Tlist_Show_Menu = 1 
let Tlist_Show_One_File = 1                 " 让taglist 可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1              " 改成右边显示
let Tlist_WinWidth = 30
let Tlist_php_settings = 'php;c:classes;i:interfaces;d:const;f:func'
let g:tlist_smali_settings = "smali;f:field;m:method"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabular 文本对齐
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 比如
" $a = 100;
" $b   = 100; 
" 你可以选择根据=号对齐, 用法: Tab/=, 也可以选择根据别的方式对齐

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => emmet 自动补全HTML标签
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 比如
" ul>ol
" 然后按 ctrl+e 
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => delimitMate 自动补全引号(单引号/双引号/反引号)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let delimitMate_expand_cr = 1 " 和其他扩展冲突了，还没找到

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-go google 出的 golang 官方插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_template_autocreate = 0
" 代码高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" 格式化 和 自动导入库
let g:go_gopls_options = ['-remote=auto']
let g:go_fmt_command = 'gofumpt' " gofmt | goimports | gofumpt 
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0

" 解决 //go:build android 开头的文件无法跳转方法的问题
let g:go_build_tags = 'linux,android,darwin,windows' 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale 语法检查
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1
" airline 和 tagbar 兼容性有问题
let g:airline#extensions#tagbar#enabled = 0
" 只在文件保存的时候检查
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
" 解决java乱码问题
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'
" ale 通过 gopls lsp 检查错误，ale 不支持代码补全
let g:ale_linters = {
  \ 'go': ['gopls'],
  \ 'python': ['pylint'],
  \}

let g:ale_python_executable = 'python3'
let g:ale_python_pylint_use_global = 1

" https://packagist.org/packages/felixfbecker/language-server
"  \ 'php': ['langserver'],
" let g:ale_php_langserver_use_global = 1
" let g:ale_php_langserver_executable = $HOME.'/.composer/vendor/bin/php-language-server.php'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 函数定义跳转
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 函数定义跳转，C-] 跳到到函数定义处，C-T、C-O 返回，C-W-] 可以分屏打开函数定义
" vim 自帶的不是 lsp，功能有限，但是使用 ALEGoToDefinition 后 ctrl+t 跳不回来, 不知道为什么
" au FileType go nnoremap <buffer> <C-]> :ALEGoToDefinition<CR>
" au FileType vim nnoremap <buffer> <C-]> :call vim#Jump()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => flutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:flutter_command = ''
let g:flutter_hot_reload_on_save = 1
" dart文件保存时自动格式化
"au BufWritePre *.dart* DartFmt
au FileType dart set tabstop=2
au FileType dart set shiftwidth=2
au FileType dart set softtabstop=2

au FileType php,java,go,rust,lua,python,javascript set tabstop=4
au FileType php,java,go,rust,lua,python,javascript set shiftwidth=4
au FileType php,java,go,rust,lua,python,javascript set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
"rkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!open %.html & <CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips 代码块补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => completor 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable lsp for go by using gopls
" let g:completor_filetype_map = {}
" let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neocomplacache 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0                               " 关闭AutoComplPop扩展，避免和neocomplcache产生冲突
let g:neocomplcache_enable_at_startup = 1                   " VIM启动时加载
let g:neocomplcache_disable_auto_complete = 0               " 是否关闭自动弹出补全列表
let g:neocomplcache_enable_smart_case = 1                   " 支持智能匹配
let g:neocomplcache_enable_camel_case_completion = 1        " 支持驼峰格式匹配关键词
let g:neocomplcache_enable_underbar_completion = 1          " 支持下划线分割的关键词
let g:neocomplcache_min_syntax_length = 3                   " 触发补全最小字符数
let g:neocomplcache_manual_completion_start_length = 3      " 触发补全字符数
let g:neocomplcache_enable_ignore_case = 1                  " 支持忽略匹配
let g:neocomplcache_lock_buffer_name_pattern = '/*ku/*'     " 缓存锁名称前缀
let g:neocomplcache_max_list = 20                           " 下拉列表个数
let g:neocomplcache_enable_auto_select = 1                  " 支持在下拉框自动选择第一个
" let g:neocomplcache_enable_auto_delimiter = 1             " 分隔符
" let g:neocomplcache_enable_wildcard = 1                   " 通配符
" let g:neocomplcache_enable_caching_message=1              " 显示启动进度

" 导入词典，和下面的au FileType go setlocal dict+=~/.vim/dict/go.dic 的功能一样
"let g:neocomplcache_dictionary_filetype_lists = {
    "\ 'default'     : '',
    "\ 'vimshell'    : $HOME.'/.vimshell_hist',
    "\ 'scheme'      : $HOME.'/.gosh_completions',
    "\ 'go'          : $HOME.'/.vim/dict/go.dic',
    "\ 'php'         : $HOME.'/.vim/dict/php.dic',
    "\ 'css'         : $HOME.'/.vim/dict/css.dict',
    "\ 'javascript'  : $HOME.'/dict/javascript.dict',
    "\ }

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.go = '\h\w*\.'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocmd 自动加载
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 退出主编辑窗口后，自动退出vim，可作用于NERDTree的nofile、nowrite、quickfix等窗口
au BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
" 每次打开文件自动定位最后编辑的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 把html文件当作xml文件来编辑，因为html按=号格式化有问题，而xml没问题
au FileType smarty,html,htm set ft=xml
au FileType smarty,html,htm set syntax=html
au BufRead,BufNewfile *.smali set filetype=smali
au BufRead,BufNewfile *.md set filetype=markdown
au FileType smali setlocal cindent

" xmledit
let xml_use_xhtml = 1

" 导入词典
au FileType php setlocal dict+=~/.vim/dict/swoole.dict
"au FileType php setlocal dict+=~/.vim/dict/php.dic     " 不需要了，VIM自带PHP函数的
"au FileType java setlocal dict+=~/.vim/dict/java.dic   " 不需要了，直接调用javacomplete，利用反射机制实现
"au FileType go setlocal dict+=~/.vim/dict/go.dic       " 不需要了，直接调用gocode服务
" html 和 smarty 调用 css、javascript 字典
au FileType smarty,html,htm setlocal dict+=~/.vim/dict/css.dict
au FileType smarty,html,htm setlocal dict+=~/.vim/dict/javascript.dict
au FileType smarty,html,htm let g:javascript_enable_domhtmlcss = 1

" 设置 filetype plugin indent on 以后 php 和 python 就不需要了，vim会自动认出来，
" 可以通过命令 :set omnifunc 检查是否成功
"au Filetype php setlocal omnifunc=phpcomplete#Complete
"au Filetype python setlocal omnifunc=python3complete#Complete
" 奇怪的是 java 和 golang 认不出来，会导致gocode没法用
" au Filetype java setlocal omnifunc=javacomplete#Complete
" au FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
" 上面为了=号格式化不出问题，把html的文件类型设置为xml了，这里需要加这个HTML标签才可以职能补齐
au FileType smarty,html,htm,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
" 生成文件列表 cscope.files
" find dir -name "*.php" -o -name "*.inc" > cscope.files
" 通过 cscope.files 生成函数列表
" cscope -Rbq
" 通过 ctrl+] 跳转到目标函数，通过 ctrl+o 或者 ctrl+t 跳回
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has("cscope")
   "set csprg=cscope " /opt/local/bin/cscope
   "set csto=1
   "set cst
   "set nocsverb
   "" add any database in current directory
   "if filereadable("cscope.out")
       "cs add cscope.out
   "endif
   "set csverb
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => gutentags 自动生成tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:gutentags_trace = 1

"" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

"" 所生成的数据文件的名称 "
"let g:gutentags_ctags_tagfile = '.tags'

"" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags

"" 检测 ~/.cache/tags 不存在就新建 "
"if !isdirectory(s:vim_tags)
   "silent! call mkdir(s:vim_tags, 'p')
"endif

"" 配置 ctags 的参数 "
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
"let g:gutentags_ctags_extra_args += ['--php-kinds=+ctif']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
