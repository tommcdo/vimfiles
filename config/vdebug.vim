""" Vdebug maps and settings

" I already have most of my usable <F*> keys mapped to other things, and many
" of them aren't usable in my desktop environment (stolen by the window manager
" or the terminal emulator). These mappings are easier to remember, and for
" 'Vdebug mode', they are all borrowed from edit commands which would otherwise
" by of no use while debugging.

" All of the Vdebug commands are always available with mappings beginning with
" <Leader>v. This can get tedious, so I've created 'Vdebug mode' that can be
" toggled by pressing <F4>. In this mode, all Vdebug commands are available as
" single-keystroke mappings (the same mappings without the <Leader>v prefix).

let g:vdebug_keymap = {
\	"run" : "<Plug>VdebugRun",
\	"run_to_cursor" : "<Plug>VdebugRunToCursor",
\	"step_over" : "<Plug>VdebugStepOver",
\	"step_into" : "<Plug>VdebugStepInto",
\	"step_out" : "<Plug>VdebugStepOut",
\	"close" : "<Plug>VdebugClose",
\	"detach" : "<Plug>VdebugDetach",
\	"set_breakpoint" : "<Plug>VdebugSetBreakpoint",
\	"get_context" : "<Plug>VdebugGetContext",
\	"eval_under_cursor" : "<Plug>VdebugEvalUnderCursor",
\	"eval_visual" : "<Plug>VdebugEvalVisual",
\}

nmap <Leader>vr <Plug>VdebugRun 
nmap <Leader>vR <Plug>VdebugRunToCursor
nmap <Leader>vo <Plug>VdebugStepOver
nmap <Leader>vi <Plug>VdebugStepInto
nmap <Leader>vu <Plug>VdebugStepOut
nmap <Leader>vC <Plug>VdebugClose
nmap <Leader>vd <Plug>VdebugDetach
nmap <Leader>vp <Plug>VdebugSetBreakpoint
nmap <Leader>vc <Plug>VdebugGetContext
nmap <Leader>vs <Plug>VdebugEvalUnderCursor
vmap <Leader>vs <Plug>VdebugEvalVisual

function! s:toggle_vdebug()
    if !exists('s:vdebug_mode')
        let s:vdebug_mode = 1
        nmap r <Plug>VdebugRun
        nmap R <plug>VdebugRunToCursor
        nmap o <Plug>VdebugStepOver
        nmap i <Plug>VdebugStepInto
        nmap u <Plug>VdebugStepOut
        nmap C <Plug>VdebugClose
        nmap d <Plug>VdebugDetach
        nmap p <Plug>VdebugSetBreakpoint
        nmap c <Plug>VdebugGetContext
        nmap s <Plug>VdebugEvalUnderCursor
        vmap s <Plug>VdebugEvalVisual
        echo "Vdebug mode on"
    else
        unlet s:vdebug_mode
        nunmap r
        nunmap R
        nunmap o
        nunmap i
        nunmap u
        nunmap C
        nunmap d
        nunmap p
        nunmap c
        nunmap s
        vunmap s
        echo "Vdebug mode off"
    endif
endfunction

nnoremap <F4> :<C-U>call <SID>toggle_vdebug()<CR>
