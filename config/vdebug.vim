""" Vdebug maps and settings
let g:vdebug_keymap = {
\	"run" : "<Leader>vs",
\	"run_to_cursor" : "<Leader>vr",
\	"step_over" : "<Plug>VdebugStepOver",
\	"step_into" : "<Plug>VdebugStepInto",
\	"step_out" : "<Plug>VdebugStepOut",
\	"close" : "<Leader>vx",
\	"detach" : "<Leader>vd",
\	"set_breakpoint" : "<Leader>vb",
\	"get_context" : "<Plug>VdebugGetContext",
\	"eval_under_cursor" : "<Plug>VdebugEval",
\	"eval_visual" : "<Plug>VdebugEvalVisual",
\}
nmap <Leader>vo <Plug>VdebugStepOver
nmap <Leader>vi <Plug>VdebugStepInto
nmap <Leader>vu <Plug>VdebugStepOut
nmap <Leader>vc <Plug>VdebugGetContext
nmap <Leader>ve <Plug>VdebugEval
vmap <Leader>ve <Plug>VdebugEvalVisual
function! s:toggle_vdebug()
    if exists('s:vdebug_mode')
        nunmap o
        nunmap i
        nunmap u
        nunmap c
        nunmap s
        vunmap s
        unlet s:vdebug_mode
        echo "Vdebug Mode off"
    else
        let s:vdebug_mode = 1
        nmap o <Plug>VdebugStepOver
        nmap i <Plug>VdebugStepInto
        nmap u <Plug>VdebugStepOut
        nmap c <Plug>VdebugGetContext
        nmap s <Plug>VdebugEval
        vmap s <Plug>VdebugEvalVisual
        echo "Vdebug Mode on"
    endif
endfunction
nnoremap <F4> :<C-U>call <SID>toggle_vdebug()<CR>
