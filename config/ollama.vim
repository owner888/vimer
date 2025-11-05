" Use Python virtual environment (and install packages via pip)
let g:ollama_use_venv = 1
let g:ollama_host = 'http://localhost:11434'
let g:ollama_model = 'starcoder2:3b'
" 控制提示前后上下文的行数，这样你可以减少 AI 提示的上下文范围来提高响应速度
let g:ollama_context_lines = 10
" debounce time to wait before triggering a completion
"let g:ollama_debounce_time = 300
" If you want to enable completion for a limited set of
" filetypes only, list them here.
let g:ollama_completion_allowlist_filetype = ['php']
" If you do not want to run completion for certain 
" filetypes, list them here.
"let g:ollama_completion_denylist_filetype = []

" chat model
let g:ollama_chat_model = 'starcoder2:3b'
" override chat system prompt
"let g:ollama_chat_systemprompt = 'Give funny answers.'

" edit model
let g:ollama_edit_model = 'starcoder2:3b'
" when disabled, LLM changs are applied directly. Useful when tracking changes via Git.
"let g:ollama_use_inline_diff = 0

" debug settings
let g:ollama_debug = 4
" general log file location
let g:ollama_logfile = '/tmp/logs/vim-ollama.log'
" ollama chat conversation log
let g:ollama_review_logfile = '/tmp/logs/vim-ollama-review.log'

let g:copilot_filetypes = {
   \ '*': v:false,
   \ 'go': v:true,
   \ }


" vim: filetype=vim.ollama
