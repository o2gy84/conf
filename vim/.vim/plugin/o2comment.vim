
function! s:LinesCommentNextState() range

    let first_line = getline(a:firstline)
    let need_comment = 1
    if first_line =~ '\v^(\s)*//'
        let need_comment = 0
    endif

    for n in range (a:firstline, a:lastline)
        let line = getline (n)

        if len(line) == 0
            return
        endif

        if need_comment == 1
            let new_line = '//'.line

            " if beginning from space
            if line =~ '\v^\s'
                let l:matches = matchlist(line, '\v^(\s+)(.*)')
                let new_line = l:matches[1] . '//' . l:matches[2]
            endif
        else
            let new_line = line

            if line =~ '\v^(\s*)//'
                let l:matches = matchlist(line, '\v^(\s*)//(.*)')
                let new_line = l:matches[1] . l:matches[2]
            endif
        endif

        call setline (n, new_line)
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


