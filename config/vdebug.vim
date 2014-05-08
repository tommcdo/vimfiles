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

nnoremap <Plug>VdebugToggleMode :<C-U>call <SID>toggle_vdebug()<CR>

nmap <Leader>vp <Plug>VdebugRun
nmap <Leader>vr <Plug>VdebugRunToCursor
nmap <Leader>vo <Plug>VdebugStepOver
nmap <Leader>vi <Plug>VdebugStepInto
nmap <Leader>vu <Plug>VdebugStepOut
nmap <Leader>vx <Plug>VdebugClose
nmap <Leader>vd <Plug>VdebugDetach
nmap <Leader>vs <Plug>VdebugSetBreakpoint
nmap <Leader>vc <Plug>VdebugGetContext
nmap <Leader>v= <Plug>VdebugEvalUnderCursor
vmap <Leader>v= <Plug>VdebugEvalVisual

function! s:toggle_vdebug()
    if !exists('s:vdebug_mode')
        let s:vdebug_mode = 1
        nmap p <Plug>VdebugRun
        nmap r <plug>VdebugRunToCursor
        nmap o <Plug>VdebugStepOver
        nmap i <Plug>VdebugStepInto
        nmap u <Plug>VdebugStepOut
        nmap x <Plug>VdebugClose<Plug>VdebugToggleMode
        nmap d <Plug>VdebugDetach
        nmap s <Plug>VdebugSetBreakpoint
        nmap c <Plug>VdebugGetContext
        nmap = <Plug>VdebugEvalUnderCursor
        vmap = <Plug>VdebugEvalVisual
        echo "Vdebug mode on"
    else
        unlet s:vdebug_mode
        nunmap p
        nunmap r
        nunmap o
        nunmap i
        nunmap u
        nunmap x
        nunmap d
        nunmap s
        nunmap c
        nunmap =
        vunmap =
        echo "Vdebug mode off"
    endif
endfunction

nmap <F4> <Plug>VdebugToggleMode
