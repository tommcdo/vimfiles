""" Haste command to paste to Hastebin

command! -range=% Haste <line1>,<line2>w !haste | tee >(xclip)
