function! LogToFile(logfile, message)
    call writefile([a:message], a:logfile, 'a')
endfunction

function! WriteFile(...)
    let message = join(a:000, ' ')
    let logfile = '/tmp/vim.log'
    call writefile([message], logfile, 'a')
endfunction

" 日志方法
function! Warn(...)
    let message = join(a:000, ' ')
    echohl WarningMsg
    echomsg '[WARNING] ' . message
    echohl None
    call LogToFile('/tmp/vim.log' message)
endfunction

function! Error(...)
    let message = join(a:000, ' ')
    echohl ErrorMsg
    echomsg '[ERROR] ' . message
    echohl None
endfunction

function! Info(...)
    let message = join(a:000, ' ')
    echohl MoreMsg
    echomsg '[INFO] ' . message
    echohl None
    call WriteFile('/tmp/vim.log' message)
endfunction

function! Debug(...)
    let message = join(a:000, ' ')
    if exists('g:debug') && g:debug == 1
        echohl Debug
        echomsg '[DEBUG] ' . message
        echohl None
    endif
endfunction

function! CopyMatches (m) 
    let @+ .= a:m . "\n" 
    return a:m
endfunction

" 回调函数
func! JadxHandler(channel, msg)
    "echo a:msg
endfunc

func Do_GoogleJavaFormat()
    " let filename=getcwd()."/".getreg('%')
    let filename = expand("%:p")
    let commands = 'java -jar '.$HOME.'/Downloads/google-java-format-1.15.0-all-deps.jar --replace ' . filename
    echohl WarningMsg | echo commands | echohl None
    " 同步任务
    let bytecode = system(commands)
    echom bytecode
    " 异步任务
    " call job_start(['java -jar '.$HOME.'/Downloads/google-java-format-1.15.0-all-deps.jar', ' --replace', filename], {'callback': 'JadxHandler'})
endfunc

func Do_Jadx()
    " let filename=getcwd()."/".getreg('%')
    let filename = expand("%:p")
    echohl WarningMsg | echo "jadx-gui ".filename | echohl None
    "同步任务
    "let bytecode = system("jadx-gui ".filename)
    "异步任务
    call job_start(["jadx-gui", " --show-bad-code", filename], {'callback': 'JadxHandler'})
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
