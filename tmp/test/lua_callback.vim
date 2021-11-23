function! s:stupidVimLWrapper(job_id, data, event) dict
    call luaeval('my_lua_callback', {'job_id': a:job_id, 'data': a:data, 'event': a:event})
endfunction

let s:callbacks = {
            \ 'on_stdout': function('s:stupidVimLWrapper'),
            \ 'on_stderr': function('s:stupidVimLWrapper'),
            \ 'on_exit': function('s:stupidVimLWrapper')
            \ }

jobstart("echo foobar", s:callbacks)
