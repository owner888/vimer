" 回调函数
func! JadxHandler(channel, msg)
    "echo a:msg
endfunc
func Do_Jadx()
    " let jadx_filename=getcwd()."/".getreg('%')
    let jadx_filename = expand("%:p")
    echohl WarningMsg | echo "jadx-gui ".jadx_filename | echohl None
    "同步任务
    "let bytecode = system("jadx-gui ".jadx_filename)
    "异步任务
    call job_start(["jadx-gui", " --show-bad-code", jadx_filename], {'callback': 'JadxHandler'})
    "echom bytecode
endfunc

func! DebugContacts()
    let ori_str = expand("%:r")
    let start_index = matchend(ori_str, "src\.")
    let debug_path = strpart(ori_str, start_index, strlen(ori_str))
    let debug_path = substitute(debug_path, "/", ".", "g")

    let debug_path .= ":".line(".")
    echo expand(debug_path)
    exec "!echo stop at ".debug_path
    exec "!{ echo "." stop at \"".debug_path."\"; cat; } | debug_contacts"
endfunc

func GetCurFilePath()
    let dir_filename = expand("%:p")
    echo dir_filename."  copy done!"
    call setreg('+', dir_filename)
endfunc

func Do_CsTag()
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
endfunc
