"==============================================================================
" Name:        GDB dispatch
" Author:      Petter Wahlman, https://www.twitter.com/badeip
" Description: Organize gdb breakpoints
" License:     BSD
"===============================================================================

if exists("g:loaded_gdb_dispatch") && g:loaded_gdb_dispatch || v:version < 700 || &cp
      finish
endif
let g:loaded_gdb_dispatch = 1

let g:tmux_session = 'gdb'      " name of tmux session containing running gdb
let g:sign_prefix = '__brk__'   " semi-unique identifier
let g:sign_tag = 'CC'           " __asm__(int3);

nnoremap <leader>ba :call gdb#add_breakpoint()<cr>
nnoremap <leader>bd :call gdb#del_breakpoint()<cr>
nnoremap <leader>bA :call gdb#enable_all()<cr>
nnoremap <leader>bD :call gdb#clear_breakpoints()<cr>
nnoremap <leader>bs :call gdb#show_breakpoints()<cr>

nnoremap <F8> :call gdb#run()<cr>
nnoremap <F9> :call gdb#continue()<cr>
nnoremap <F4> :call gdb#step()<cr>
nnoremap <F5> :call gdb#next()<cr>
