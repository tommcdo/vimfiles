command! -range=% Enumerate <line1>,<line2>s/^/\=(1+line('.')-<line1>).". "/
