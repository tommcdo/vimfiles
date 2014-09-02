syntax match Brackets display '[(){}\[\]]'
highlight Brackets ctermfg=124

syntax match ClassName display '\<\([A-Z][a-z]*\)\+\>'
syntax match ClassName display '\.\@<=\*'
highlight link ClassName Identifier

syntax match Constructor display '\(\(public\|protected\|private\)\s\+\)\@<=\([A-Z][a-z]*\)\+\( *(\)\@='
highlight link Constructor PreProc
