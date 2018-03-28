
function! s:LinesCommentNextState() range

    let l:extension = expand('%:e')

    let l:comment_symbol = "#"
    if l:extension == "c"
        let l:comment_symbol = "\/\/"
    elseif l:extension == "cpp"
        let l:comment_symbol = "\/\/"
    elseif l:extension == "h"
        let l:comment_symbol = "\/\/"
    elseif l:extension == "hpp"
        let l:comment_symbol = "\/\/"
    elseif l:extension == "xs"
        let l:comment_symbol = "\/\/"
    elseif l:extension == "vim"
        let l:comment_symbol = "\""
    elseif l:extension == "lua"
        let l:comment_symbol = "--"
    elseif l:extension == "go"
        let l:comment_symbol = "\/\/"
    elseif l:extension == "js"
        let l:comment_symbol = "\/\/"
    else
        "default '#'
    endif

    let l:first_line = getline(a:firstline)

    let l:need_comment = 1

    " if string already commented, no need comment twice
    if l:first_line =~ '\v^(\s)*' . l:comment_symbol
        let l:need_comment = 0
    endif

    for n in range (a:firstline, a:lastline)
        let l:line = getline (n)

        if len(l:line) == 0
            continue
        endif

        if l:need_comment == 1
            " comment it!
            let l:new_line = l:comment_symbol . l:line

            " but if beginning from space, need save all spaces
            if l:line =~ '\v^\s'
                let l:matches = matchlist(l:line, '\v^(\s+)(.*)')
                let l:new_line = l:matches[1] . l:comment_symbol . l:matches[2]
            endif
        else
            let l:new_line = l:line

            if l:line =~ '\v^(\s*)' . l:comment_symbol
                let l:matches = matchlist(l:line, '\v^(\s*)' . l:comment_symbol . '(.*)')
                let l:new_line = l:matches[1] . l:matches[2]
            endif
        endif

        call setline (n, l:new_line)
    endfor
endfunction

function! SaveCursor()
    let s:cursor = getpos('.')
endfunction

function! RestoreCursor()
    call setpos('.', s:cursor)
    unlet s:cursor
endfunction

command! -range LinesCommentNextState call SaveCursor() | <line1>,<line2>call s:LinesCommentNextState() | call RestoreCursor()


