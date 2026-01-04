" Use Python virtual environment (and install packages via pip)
let g:ollama_use_venv = 1

" 不支持采样(旧版模型)的模型
let g:ollama_model_sampling_denylist = ['gpt-5', 'gpt-5.1-codex']

" Claude Sonnet 4 配置
" let g:ollama_claude_credentialname = 'api-keys/anthropic-key'

" Tab completion: 使用 OpenAI gpt-5.1-codex (使用 /v1/responses 端点)
let g:ollama_model_provider = 'claude'
let g:ollama_model = 'claude-sonnet-4-20250514'
" let g:ollama_model_provider = 'openai_responses'
" let g:ollama_model = 'gpt-5.1-codex'

" Chat: 使用 OpenAI
let g:ollama_chat_provider = 'openai'
let g:ollama_chat_model = 'gpt-5'

" Code editing: 使用 OpenAI
let g:ollama_edit_provider = 'openai'
let g:ollama_edit_model = 'gpt-4o-mini'

" OpenAI API configuration
" let g:ollama_openai_baseurl = 'https://api.openai.com/v1'

" 查看模型：curl http://127.0.0.1:11434/api/tags
" let g:ollama_host = 'http://localhost:11434'
" let g:ollama_model = 'starcoder2:3b'
" let g:ollama_host = 'http://192.168.6.164:11434'
" let g:ollama_host = 'http://10.10.10.18:11434'
" let g:ollama_model = 'codellama:13b-instruct'

" 控制提示前后上下文的行数，这样你可以减少 AI 提示的上下文范围来提高响应速度
" let g:ollama_context_lines = 100
" debounce time to wait before triggering a completion
" let g:ollama_debounce_time = 300
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

let g:ollama_completion_allowlist_filetype = ['php']
let g:copilot_filetypes = {
   \ '*': v:true,
   \ 'php': v:false,
   \ }

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
