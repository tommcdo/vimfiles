""" Custom commands that don't yet warrant a plugin
command! -range=% Haste <line1>,<line2>w !haste | tee >(xclip)
