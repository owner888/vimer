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
" 调用 jadx-gui 进行 smali -> java 转换并阅读
nnoremap <F8> :call Do_Jadx()<CR>
" 当前文件完整路径拷贝到系统剪贴板
nnoremap <silent> <F9> :call GetCurFilePath()<CR>
" F12在当前目录生成ctags
noremap <F12> :call Do_CsTag()<CR>

map <C-\> <plug>NERDCommenterToggle
" map php-doc key inoremap:插入模式 nnoremap:命令行模式 vnoremap:视图模式
imap <C-D> <ESC> :call PhpDocSingle()<CR>i
nmap <C-D> :call PhpDocSingle()<CR>
vmap <C-D> :call PhpDocSingle()<CR>
vmap <C-Z> zf<CR>

"execute current line
nmap <leader>te :.w !bash<CR>

",,d 打开Dash
"nmap <Leader><Leader>d :Dash<CR>
",,m 打开MRU，和nerdtree有冲突，已经删除
nmap <Leader><Leader>m :Mru<CR>
" ,dd 添加当前行为断点调试行
nmap <Leader><Leader>d :call DebugContacts()<CR>

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

"control+h进入左边的窗口
"nmap <C-H> <C-W>h 
"control+j进入下边的窗口
"nmap <C-J> <C-W>j  
"control+k进入上边的窗口
"nmap <C-K> <C-W>k 
"control+l进入右边的窗口
"nmap <C-L> <C-W>l 
