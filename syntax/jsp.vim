syntax clear

" Use XML syntax as a base
source $VIMRUNTIME/syntax/xml.vim

highlight jspDelim ctermfg=166
highlight jspPunct ctermfg=64
highlight link jspKeyword jspPunct
highlight jspExpression ctermfg=125
highlight jspLiteral ctermfg=61
highlight link jspString jspLiteral
highlight link jspNumber jspLiteral
highlight link jspComment Comment

syntax region jspComment containedin=ALL start=/<%--/ end=/--%>/
syntax region jspExpression matchgroup=jspDelim containedin=ALL contains=jspString,jspPunct,jspKeyword,jspLiteral,jspNumber start=/\${/ end=/}/
syntax match jspPunct +[[:punct:]]+ contained
syntax keyword jspKeyword contained and eq gt instanceof or ne le empty not lt ge div mod
syntax keyword jspLiteral contained true false null
syntax region jspString matchgroup=jspPunct start=/'/ end=/'/ skip=/\\'/ contained
syntax match jspNumber +\<[[:digit:]]\+\%(\.[[:digit:]]\+\)\=\>+ contained

unlet b:current_syntax
syntax include @jspCssSyntax syntax/css.vim
syntax region jspCss matchgroup=xmlTag start=+<style[^>]*>+ end=+</style>+ contains=@jspCssSyntax

unlet b:current_syntax
syntax include @jspJavaScriptSyntax syntax/javascript.vim
syntax region jspJavaScript matchgroup=xmlTag start=+<script[^>]*>+ end=+</script>+ contains=@jspJavaScriptSyntax,jspComment,jspExpression

unlet b:current_syntax
syntax include @jspJavaSyntax syntax/java.vim
syntax region jspJava matchgroup=jspDelim containedin=ALL start=+<%=+ end=+%>+ contains=@jspJavaSyntax keepend
