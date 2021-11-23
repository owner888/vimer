" 防止Mac按shift切换输入法误操作
cmap W w
cmap Q q

"map <F4> :TlistToggle<CR>
"map <F8> t :NERDTreeMirror<CR>gT<C-w>w<ESC>gt<C-w>w    " 新标签打开一个文件，复制目录树
"nmap <Leader>f :NERDTreeToggle<CR>
"nmap <Leader>F :NERDTreeFind<CR>
"nmap <Leader>s :NERDTreeMirror<CR>

map <F2> :NERDTreeToggle<CR> 
"map <F3> :TlistToggle<CR>
map <F3> :TagbarToggle<CR>
map <F5> :tabprev<CR>
map <F6> :tabnext<CR>
map <C-\> <plug>NERDCommenterToggle
" map php-doc key inoremap:插入模式 nnoremap:命令行模式 vnoremap:视图模式
imap <C-D> <ESC> :call PhpDocSingle()<CR>i
nmap <C-D> :call PhpDocSingle()<CR>
vmap <C-D> :call PhpDocSingle()<CR>

"control+h进入左边的窗口
"nmap <C-H> <C-W>h 
"control+j进入下边的窗口
"nmap <C-J> <C-W>j  
"control+k进入上边的窗口
"nmap <C-K> <C-W>k 
"control+l进入右边的窗口
"nmap <C-L> <C-W>l  

"execute current line
nmap <leader>te :.w !bash<CR>

",,d 打开Dash
nmap <Leader><Leader>d :Dash<CR>
",,m 打开MRU，和nerdtree有冲突，已经删除
nmap <Leader><Leader>m :Mru<CR>

" 空格打开关闭代码折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 去掉windows下编辑器产生的 ^M
"vmap ++ :%s/<C-V><cr>//ge<cr>'tzt'm
"nmap ++ :%s/<C-V><cr>//ge<cr>'tzt'm
" 删除所有行未尾空格
"nmap -- :%s,/s/+$,,g
"nmap -- :%s,/s/+$,,g

" Ctrl+S实现保存，如果未命名文件名会提示你选择保存路径和文件名，gui（gvim 命令）下有效, 且win才有效
"map <silent> <C-S> :if expand("%") == ""<CR>:browse confirm w<CR>:else<CR>:confirm w<CR>:endif<CR>
"map mm '.zz
"map <silent> <leader>b :bn<cr> " 编辑上一个缓存文件
"map <silent> <leader>n :bp<cr> " 编辑下一个缓存文件

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" F12在当前目录生成ctags
"noremap <F8> :call Do_Jadx()<CR>
nnoremap <F8> :call Do_Jadx()<CR>
" 回调函数
func! Handler(channel, msg)
    "echo a:msg
endfunc
func Do_Jadx()
    let cur_dir=getcwd()
    let cur_file_name=getreg('%')
    let dir_filename=cur_dir."/".cur_file_name
    echohl WarningMsg | echo "jadx-gui ".dir_filename | echohl None
    "同步任务
    "let bytecode = system("jadx-gui ".dir_filename)
    "异步任务
    call job_start(["jadx-gui", dir_filename], {'callback': 'Handler'})
    "echom bytecode
endfunc

" F9 复制当前文件完整路径拷贝到系统剪贴板
nnoremap <silent> <F9> :call GetCurFilePath()<CR>
function GetCurFilePath()
    let cur_dir=getcwd()
    let cur_file_name=getreg('%')
    let dir_filename=cur_dir."/".cur_file_name
    echo dir_filename."    copy done!"
    call setreg('+',dir_filename)
endfunction

" F12在当前目录生成ctags
noremap <F12> :call Do_CsTag()<CR>
function Do_CsTag()
    if(!executable('ctags'))
        echohl WarningMsg | echo "No executable ctags found!" | echohl None
        return
    endif
    if(!executable('cscope'))
        echohl WarningMsg | echo "No executable cscope found!" | echohl None
        return
    endif
    let iswindows=0
    if has("win32")
        let iswindows=1
    endif
    let dir = getcwd()
    if filereadable("tags")
        if(iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags, code=" . tagsdeleted . " permission error?" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files code=" . csfileseleted . " permission error?" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out code=" . csoutdeleted . " permission error?" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+fq .>/dev/null 2>&1"
    endif
    if(executable('cscope') && has("cscope") )
        if(iswindows==0)
            "silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
            silent! execute "!find . -name '*.php' -o -name '*.go' -o -name '*.java' > cscope.files"
        else
            "silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
            silent! execute "!dir /s/b *.php,*.go,*.java >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            silent! execute "cs add cscope.out"
        endif
    endif
    redraw!
    echo "Refresh ctags okay!"
endfunction
