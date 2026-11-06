" 加载本地私密配置（若存在，如 OPENAI_API_KEY、私有 baseurl 等）
silent! source <sfile>:h/ollama.local.vim

" Use Python virtual environment (and install packages via pip)
let g:ollama_use_venv = 1

" OpenAI baseurl 默认空（使用官方 API），如需走中转网关请在 ollama.local.vim 中覆盖
if !exists('g:ollama_openai_baseurl')
    let g:ollama_openai_baseurl = ''
endif

" 本地 Ollama 服务地址
let g:ollama_host = 'http://localhost:11434'

" Tab completion: 代码补全（使用本地 qwen2.5-coder 极速补全）
let g:ollama_model_provider = 'ollama'
let g:ollama_model = 'qwen2.5-coder:1.5b-base'

" Chat: 对话
let g:ollama_chat_provider = 'openai'
let g:ollama_chat_model = 'claude-3-7-sonnet'

" Code editing: 代码编辑
let g:ollama_edit_provider = 'openai'
let g:ollama_edit_model = 'claude-3-7-sonnet'

" 查看模型：curl http://127.0.0.1:11434/api/tags
" let g:ollama_host = 'http://localhost:11434'
" let g:ollama_model = 'starcoder2:3b'
" let g:ollama_host = 'http://192.168.6.164:11434'
" let g:ollama_host = 'http://10.10.10.18:11434'
" let g:ollama_model = 'codellama:13b-instruct'

" 控制提示前后上下文的行数，这样你可以减少 AI 提示的上下文范围来提高响应速度
let g:ollama_context_lines = 40
" debounce time to wait before triggering a completion (缩短到 150ms 减少等待)
let g:ollama_debounce_time = 150
" If you do not want to run completion for certain
" filetypes, list them here.
" let g:ollama_completion_denylist_filetype = []

" chat model
" let g:ollama_chat_model = 'codellama:13b-instruct'
" override chat system prompt
" let g:ollama_chat_systemprompt = 'Give funny answers.'

" edit model
" let g:ollama_edit_model = 'codellama:13b-instruct'
" when disabled, LLM changs are applied directly. Useful when tracking changes via Git.
" let g:ollama_use_inline_diff = 0

" debug settings
let g:ollama_debug = 4
" general log file location
let g:ollama_logfile = '/tmp/logs/vim-ollama.log'
" ollama chat conversation log
let g:ollama_review_logfile = '/tmp/logs/vim-ollama-review.log'

" 允许所有语言触发代码补全（为空则不限制文件类型）
let g:ollama_completion_allowlist_filetype = []

" Keybindings
" Shift + Command + i to open OllamaChat
" In macOS terminal/GUI, Command key mappings depend on your terminal emulator
" For MacVim/NeoVim-Qt: use <D-I> for Command+Shift+i
if has("gui_macvim") || has("gui_running")
    nnoremap <D-I> :OllamaChat<CR>
    inoremap <D-I> <Esc>:OllamaChat<CR>
    vnoremap <D-I> <Esc>:OllamaChat<CR>
endif

" vim: filetype=vim.ollama
