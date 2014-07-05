function! s:basename(path)
    let l:base_idx = strridx(a:path, "/")
    if l:base_idx > -1
        let basename = strpart(a:path, l:base_idx + 1)
    else
        let basename = a:path
    endif
    return basename
endfunction

function! s:get_list(prefix)
    redir => l:bl
    silent! exe "sign list"
    redir end

    let l:breakpoints = []
    for l:n in split(l:bl , '\n')
        if stridx(l:n, a:prefix) > 0
            let l:entry = split(strpart(n, strlen("sign " . a:prefix)), ':')
            let l:tmp = split(l:entry[1], " ")
            let l:new = [ entry[0], l:tmp[0] ]
            call add(l:breakpoints, l:new)
        endif
    endfor
    return l:breakpoints
endfunction

" add single breakpoint
function! gdb#add_breakpoint(...)
    if a:0 == 2
        let l:base = s:basename(a:1)
        let l:line = a:2
    else
        let l:base = s:basename(expand('%'))
        let l:line = line('.')
    endif

    let l:cmd = '!tmux send -t ' . g:tmux_session . ':0 "break ' . l:base . ':' . l:line  . '"' . " ENTER"
    silent! exe l:cmd | redraw!

    let l:sign_name = g:sign_prefix . l:base . ":" . l:line
    let l:cmd = ":sign define " . l:sign_name . " text=" . g:sign_tag . " texthl=Error"
    silent! exe l:cmd

    let l:cmd = ":sign place 2 line=" . l:line . " name=" . l:sign_name . " file=" . expand('%')
    silent! exe l:cmd | redraw!
endfunction

" delete sigle breakpoint
function! gdb#del_breakpoint(...)
    if a:0 == 2
        let l:base = s:basename(a:1)
        let l:line = a:2
    else
        let l:base = s:basename(expand('%'))
        let l:line = line('.')
    endif

    let l:cmd = '!tmux send -t ' . g:tmux_session . ':0 "clear ' . l:base . ':' . l:line  . '"' . " ENTER"
    silent! exe l:cmd | redraw!

    let l:sign_name = g:sign_prefix . l:base . ":" . l:line
    let l:cmd = ":sign undefine " . l:sign_name
    silent! exe l:cmd | redraw!
endfunction

" enable all breakpoins marked in vim
function! gdb#enable_all()
    let l:breakpoints = s:get_list(g:sign_prefix)
    for l:n in l:breakpoints
        silent! call gdb#add_breakpoint(l:n[0], l:n[1])
    endfor
endfunction

" delete all breakpoints marked in vim
function! gdb#clear_breakpoints()
    let l:breakpoints = s:get_list(g:sign_prefix)
    if len(l:breakpoints) == 0
        echo "no breakpoints enabled"
    else
        for l:n in l:breakpoints
            call gdb#del_breakpoint(l:n[0], l:n[1])
        endfor
    endif
endfunction

" list all breakpoins marked in vim
function! gdb#show_breakpoints()
    let l:breakpoints = s:get_list(g:sign_prefix)
    if len(l:breakpoints) == 0
        echo "no breakpoints enabled"
    else
        echo "breakpoints:"
        for l:n in l:breakpoints
            echo "    " . l:n[0] . ":" . l:n[1]
        endfor
    endif
endfunction

function! gdb#run()
    let l:cmd = '!tmux send -t ' . g:tmux_session . ':0 "run"' . " ENTER"
    silent! exe l:cmd | redraw!
endfunction

function! gdb#continue()
    let l:cmd = '!tmux send -t ' . g:tmux_session . ':0 "continue"' . " ENTER"
    silent! exe l:cmd | redraw!
endfunction

function! gdb#step()
    let l:cmd = '!tmux send -t ' . g:tmux_session . ':0 "step"' . " ENTER"
    silent! exe l:cmd | redraw!
endfunction

function! gdb#next()
    let l:cmd = '!tmux send -t ' . g:tmux_session . ':0 "next"' . " ENTER"
    silent! exe l:cmd | redraw!
endfunction
