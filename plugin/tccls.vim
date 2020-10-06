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
\                "cache": {
\                    "directory": "/tmp/ccls-cache"
\                },
\                "client": {
\                    "snippetSupport": v:true
\                },
\                "highlight": {
\                    "lsRanges" : v:false
\                },
\                "index": {
\                    "threads": 1
\                },
\                "workspaceSymbol": {
\                    "sort": v:true
\                },
\                "clang": {
\                    "extraArgs": ["--gcc-toolchain=/usr"],
\                    "resourceDir": s:clang_res_dir
\                }
\            }
\        }
\    }
\}
