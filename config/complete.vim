function! s:get_strings() abort
    let l:pattern = '".\{-}\\\@<!"'
    let l:results = []
    let l:lines_from_cursor = range(line('.'), 1, -1) + range(line('$'), line('.') + 1, -1)
    for l:line_num in l:lines_from_cursor
        let l:line_matches = []
        let l:line = getline(l:line_num)
        let l:start = 0
        let l:pos = match(l:line, l:pattern, l:start)
        while l:pos >= 0
            let [l:match, l:start_pos, l:end_pos] = matchstrpos(l:line, l:pattern, l:start)
            if index(l:results, l:match) < 0 && index(l:line_matches, l:match) < 0
                let l:line_matches += [l:match]
            endif
            let l:start = l:end_pos + 1
            let l:pos = match(l:line, l:pattern, l:start)
        endwhile
        let l:results += reverse(l:line_matches)
    endfor
    return l:results
endfunction

function! s:complete_string()
	call complete(col('.'), s:get_strings())
	return ''
endfunction

inoremap <C-X>" <C-R>=<SID>complete_string()<CR>
