call submode#enter_with('window-resize', 'n', '', "\<C-W>-", "\<C-W>-")
call submode#enter_with('window-resize', 'n', '', "\<C-W>+", "\<C-W>+")
call submode#enter_with('window-resize', 'n', '', "\<C-W>\<", "\<C-W>\<")
call submode#enter_with('window-resize', 'n', '', "\<C-W>>", "\<C-W>>")
call submode#leave_with('window-resize', 'n', '', "\<Esc>")
call submode#map('window-resize', 'n', '', '-', "\<C-W>-")
call submode#map('window-resize', 'n', '', '+', "\<C-W>+")
call submode#map('window-resize', 'n', '', '<', "\<C-W>\<")
call submode#map('window-resize', 'n', '', '>', "\<C-W>>")
