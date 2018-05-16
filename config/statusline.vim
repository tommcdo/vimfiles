let s:active_bg      = 233
let s:active_fg      = 242
let s:inactive_bg    = 237
let s:inactive_fg    = 242

function! s:define_colors()
	let s:filename = s:create_group(s:active_bg, 250, 'bold')
	let s:branch   = s:create_group(s:active_bg, 178, 'bold')
	let s:branch_b = s:create_group(s:active_bg, 6, 'bold')
	let s:green    = s:create_group(s:active_bg, 70, 'bold')
	let s:red      = s:create_group(s:active_bg, 88, 'bold')
	let s:flare    = s:create_group(s:active_bg, 64, 'bold')
	let s:blue     = s:create_group(s:active_bg, 33, 'bold')
endfunction

function! MyStatusLine()
	let l:s = ''
	let l:s .= '%<'
	let l:s .= s:hi('%{statusline#get_filename()}', s:filename)
	let l:s .= ' %h'
	let l:s .= s:hi('%{&readonly?"*":""}', s:red)
	let l:s .= s:hi('%{&modified?"✗ ":""}', s:red)
	let l:s .= s:hi('%{(&modifiable&&!&modified)?"✓ ":""}', s:green)
	let l:s .= s:hi('%{statusline#modified_buffers()}', s:red)
	let l:s .= '%='
	let l:s .= s:hi('%{statusline#buffer_flare()} ', s:flare)
	let l:s .= s:hi('%{statusline#kangaroo()}', s:blue)
	let l:s .= s:eclim_problems()
	let l:s .= s:git_branch()
	let l:s .= s:hi('%{argc()>0?("   A[".(argc()<10?repeat("-",argidx()).(expand("%")==argv(argidx())?"+":"~").repeat("-",argc()-argidx()-1):(argidx()+1).(expand("%")==argv(argidx())?"/":"|").argc())."]"):""}', s:green)
	let l:s .= '  '
	let l:s .= s:hi('%{statusline#grep_fallback()}', s:red)
	let l:s .= '%-14.(%l,%c%V%) '
	let l:s .= '%P'
	return l:s
endfunction

function! statusline#get_filename()
	if &filetype == 'help'
		let filename = expand('%:t')
	elseif &filetype == 'gitcommit'
		if expand('%') == '.git/index'
			let filename = 'git status'
		elseif expand('%:t') == 'COMMIT_EDITMSG'
			let filename = 'git commit'
		else
			let filename = 'git'
		endif
	else
		let filename = expand('%')
	endif
	return filename
endfunction

function! statusline#modified_buffers()
	let l:modified_buffers = len(filter(range(1, bufnr('$')), 'getbufvar(v:val, "&modified") && buflisted(v:val)')) - &modified
	return l:modified_buffers == 0 ? '': '(+'.l:modified_buffers.')'
endfunction

function! statusline#git_branch()
	return exists('b:git_dir') ? fugitive#head(7) : ''
endfunction

function! statusline#git_str(str)
	return exists('b:git_dir') ? a:str : ''
endfunction

function! statusline#grep_fallback()
	return exists('g:grep_fallback') ? g:grep_fallback.'  ' : ''
endfunction

function! statusline#buffer_flare()
	return exists('b:statusline_flare') ? b:statusline_flare : ''
endfunction

function! statusline#eclim_str(str)
	return eclim#project#util#GetCurrentProjectName() != '' ? a:str : ''
endfunction

function! statusline#kangaroo()
	let l:altitude = kangaroo#altitude()
	if l:altitude > 0
		return repeat('|', l:altitude) . ' '
	endif
	return ''
endfunction

function! s:eclim_problems()
	let l:s = ''
	let l:s .= s:hi('%{statusline#eclim_str("[")}', s:filename)
	let l:s .= s:hi('%{statusline#eclim_str(eclim#project#problems#IsProblemsList()&&len(getqflist())>0?len(getqflist())." problem".(len(getqflist())==1?"":"s"):"")}', s:red)
	let l:s .= s:hi('%{statusline#eclim_str(eclim#project#problems#IsProblemsList()&&len(getqflist())==0?"no problems":"")}', s:green)
	let l:s .= s:hi('%{statusline#eclim_str(!eclim#project#problems#IsProblemsList()?statusline#eclim_str("?"):"")}', s:red)
	let l:s .= s:hi('%{statusline#eclim_str("] ")}', s:filename)
	return l:s
endfunction

function! s:git_branch()
	let l:s = ''
	let l:s .= s:hi('%{statusline#git_str("{")}', s:branch_b)
	let l:s .= s:hi('%{statusline#git_branch()}', s:branch)
	let l:s .= s:hi('%{statusline#git_str("\u007d")}', s:branch_b)
	return l:s
endfunction

let s:group_number = 0
function! s:create_group(background, foreground, term)
	let s:group_number += 1
	call s:define('User'.s:group_number, a:background, a:foreground, a:term)
	return s:group_number
endfunction

function! s:define(group, background, foreground, term)
	execute 'highlight '.a:group.' cterm='.a:term.' ctermbg='.a:background.' ctermfg='.a:foreground
endfunction

function! s:hi(term, color)
	return '%'.a:color.'*'.a:term.'%*'
endfunction

call s:define('StatusLine', s:active_bg, s:active_fg, 'bold')
call s:define('StatusLineNC', s:inactive_bg, s:inactive_fg, 'none')

call s:define_colors()
set statusline=%!MyStatusLine()
