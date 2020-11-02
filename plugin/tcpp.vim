let s:path = expand('<sfile>:p:h')
let s:ccls_bin = s:path . "/../bin/ccls"
let s:clang_res_dir = s:path . "/../clang"

let g:coc_user_config = {
\    "json.enable": v:false,
\    "diagnostic": {
\        "enable": v:true,
\        "refreshAfterSave": v:true
\    },
\    "languageserver": {
\        "ccls": {
\            "command": s:ccls_bin,
\            "args": ["--log-file=/tmp/ccls.log", "-v=1"],
\            "trace.server": "verbose",
\            "filetypes": ["c", "cc", "cpp"],
\            "rootPatterns": [".ccls"],
\            "initializationOptions": {
\                "index": {
\                    "threads": 4
\                },
\                "clang": {
\                    "resourceDir": s:clang_res_dir
\                }
\            }
\        }
\    }
\}

" compile single source file of codm
"let &makeprg = s:path . "/../bin/compile_single_file.py " . '%:p'
"noremap <F9> :make<cr>
"noremap <F10> :cn<cr>
"noremap <F11> :cp<cr>
 
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

" get rid of '|' characters that appears on vertical split
" note the significant whitespace after the '\' character
"set fillchars+=vert:\ 

" clang-format
let g:clang_format_path = s:path . '/../bin/clang-format'
let g:clang_script_path = s:path . '/../bin/clang-format.py'
if has('python')
    map <expr> <C-M> ":pyf " . g:clang_script_path . "<cr>"
elseif has('python3')
    map <expr> <C-M> ":py3f " . g:clang_script_path . "<cr>"
endif
