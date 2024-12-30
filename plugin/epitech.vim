""
"" EPITECH PROJECT, 2023
"" Vim Epitech
"" File description:
"" A plugin to config Vim following EPITECH's guidelines
""

" Prevent loading the plugin twice
if exists("g:loaded_vim_epitech")
    finish
endif
let g:loaded_vim_epitech = 1

" Considerate a *.h as *.c
autocmd BufNewFile,BufRead *.h set filetype=c

if (&ft == 'c') || (&ft == 'cpp')
    setlocal comments=s:/*,m:**,ex:*/
endif

let s:filetypeMap = {
    \ 'c': {'b': '/*', 'm': '**', 'e': '*/'},
    \ 'make': {'b': '##', 'm': '##', 'e': '##'},
    \ 'haskell': {'b': '{-', 'm': '--', 'e': '-}'},
\}

function! s:Epiyear()
    let old_time = v:lc_time
    language time en_US.utf8
    let str = strftime("%Y")
    exec 'language time '.old_time
    return str
endfunction

function! Epi_header()
    if has_key(s:filetypeMap, &filetype)
        let l:bcom = s:filetypeMap[&filetype]['b']
        let l:mcom = s:filetypeMap[&filetype]['m']
        let l:ecom = s:filetypeMap[&filetype]['e']

        let l:ret = append(0, l:bcom)
        let l:ret = append(1, l:mcom . " EPITECH PROJECT, µYEARµ")
        let l:ret = append(2, l:mcom . " __")
        let l:ret = append(3, l:mcom . " File description:")
        let l:ret = append(4, l:mcom . " _")
        let l:ret = append(5, l:ecom)
    endif
    1,6s/µYEARµ/\= s:Epiyear()/ge
    :8
endfunction

command! EpiHeader call Epi_header()
nnoremap <C-c><C-h> :EpiHeader<CR>
