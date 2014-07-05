" phpDoc for Vim
" Copyright (c) 2002-2004 Vidyut Luther
" Based on Arjen Moolenars Gnomedoc.vim for vim. 
" Based on Michael Zucchi's Gnome-Doc.el (in 'gnome-libs/tools')
" 
" This file auto-generates a PHP function document header from the
" current function. It uses the phpDoc tag standard. 
"
" In your .vimrc, add something like this (use Ctrl-R for adding headers):
"	source gnome-doc.vim
"	map <C-R> :exe PhpDoc()<CR>
"

" PhpDoc() expects te first '{' of the function to start on the first column
" of a new line and a blank line before the function declaration.
"
" These special patterns are recognized by gnome-doc for further processing:
"	'funcname()'	function
"	'$ENVVAR'	environmental variable
"	'&struct_name'	name of a structure
"	'@parameter'	name of a parameter
"	'%CONST'	name of a constant

if has ("user_commands")

func! PhpDoc()
	" A function contains three parts: a return type, a name and parameters
	let c_func_RE = '^[ ]*\(.*\)[ ]\{1,\}\([^ ]\{1,\}\)[ ]*([ ]*\(.*\)[ ]*)'

	" Shortcuts for editing the text:
	let txtBOL = "norm! o"
	let txtEOL = ""
	" Depending on some VI variables that I do not know you might have
	" to change these...
	"	txtCommentHead	Start the comment block
	"	txtComment1	Line used for first comment line
	"	txtCommentn	Line used for following comment lines
	"	txtCommentTail	End of the comment block

  if b:current_syntax == "php"
		" ... PHP doesn't either 
		let txtCommentHead = "/**"
		let txtComment1 = " * "
		let txtCommentn = "* "
		let txtCommentTail = "**/"
	else
		" Most other languages use # for comments
		" NOTE: This is just an extra option. The code is written for
		"	C files, nothing else!
		let txtCommentHead = "##"
		let txtComment1 = "# "
		let txtCommentn = "# "
		let txtCommentTail = "##"
	endif

	let LineToEndOn = line(".")

	" Go to the beginning of the file
	"exe "norm! [["
	let lastline = line (".") - 1

	" Find the previous blank line and assume the function starts there
	exe "norm! {"
	let firstline = line (".") + 1

	let i = firstline
	let name = ""
	while i <= lastline
		" Remove "//" comments directly
		let name = name . " " . substitute (getline (i), '\(.*\)\/\/.*', '\1', "")
		let i = i + 1
	endwhile

	" First some things to make it more easy for us:
	" tab -> space && space+ -> space
	let name = substitute (name, '\t', ' ', "")
	let name = substitute (name, '  *', ' ', "")

	" Now we have to split DECL in three parts:
	" \(return type\)\(funcname\)\(parameters\)
	let returntype = substitute (name, c_func_RE, '\1', "g")
	let funcname = substitute (name, c_func_RE, '\2', "g")
	let parameters = substitute (name, c_func_RE, '\3', "g") . ","

	"echo "Line(" . firstline . ", " . lastline . ")=" . funcname . "|" . parameters . "|" . returntype . "|"

	exe txtBOL . txtCommentHead . txtEOL
	exe txtBOL . txtComment1 . funcname . ":" . txtEOL

	while (parameters != ",") && (parameters != "") && (parameters != "void,")
		let _p = substitute (parameters, '\([^,]*\) *, *\(.*\)', '\1', "")
		let parameters = substitute (parameters, '\([^,]*\) *, *\(.*\)', '\2', "")
		let paramname = substitute (_p, '.*[^A-Za-z_]\([A-Za-z_][A-Za-z0-9_]*\)\(\[[0-9]\]\)*$', '\1', "")
		exe txtBOL . txtCommentn . "@param $" . paramname . ": " . txtEOL
	endwhile

	if returntype !~# '\(^\|[^A-Za-z0-9_]\)void\([^A-Za-z0-9_]\|$\)'
		exe txtBOL . txtCommentn . txtEOL
		exe txtBOL . txtCommentn . "@return " . txtEOL
		exe txtBOL . txtCommentn . "@access " . txtEOL

	endif

	" Close the comment block.
	exe txtBOL . txtCommentTail . txtEOL

	" Let the editor go to the right line so the user can start editing
	" right away.
	return "norm! " . LineToEndOn . "G$"
endfunc

func! PhpDocVarBlock()

  if getline(".") !~ '^\s*var\s\+\$'
		return
	endif
	let l:line = getline(".")

  " if the first char of the var is not a _, then the access
  " is public
	if l:line =~ '^\s*var\s\+\$[A-Za-z]\+'
		let l:index = matchend(l:line, '^\s*var\s\+\$')
		let l:prefix = matchstr(l:line, '[A-Za-z]', l:index) 
		let l:access = 'public'
	endif
  " Otherwise it is private 
	if l:line =~ '^\s*var\s\+\$_'
		let l:index = matchend(l:line, '^\s*var\s\+\$_')
		let l:prefix = matchstr(l:line, '[A-Za-z]', l:index)
		let l:access = 'private'	
	endif

  " Get the l:prefix of the l:line to l:indent the
	" auto inserted text the same as the rest...
	let l:indent = matchstr(l:line, '^\s*')

 
	"let txtCommentHead = "/**"
	"let txtComment1 = " * "
	"let txtCommentn = "* "
	"let txtCommentTail = "**/"
	"let txtBOL = "norm! o"
	"let txtEOL = ""

" Find the previous blank line and assume the function starts there
	exe "norm! {"
	let firstline = line (".") + 1
  let lastline = line (".") - 1
  let LineToEndOn = line(".") + 2 

	let i = firstline
	let name = ""
	while i <= lastline
		" Remove "//" comments directly
		let name = name . " " . substitute (getline (i), '\(.*\)\/\/.*', '\1', "")
		let i = i + 1
	endwhile

	"exe l:indent . txtBOL . txtCommentHead . txtEOL
	"exe l:indent . txtBOL . txtCommentn . "@var " . txtEOL
	"exe l:indent . txtBOL . txtCommentn . "@access " . l:access .  txtEOL
	" Close the comment block.
	"exe l:indent . txtBOL . txtCommentTail . txtEOL
	" Let the editor go to the comment block so the user can start editing
	" and completing the doc block 
	
  let @z= l:indent . "/**\n"
	let @z=@z . l:indent . " * Description of the Variable\n"
	let @z=@z . l:indent . " * @var\t\t" . "\n" 
	let @z=@z . l:indent . " * @access\t" . l:access . "\n"
	let @z=@z . l:indent . " */\n"
	put! z
 
  
  return "norm! " . LineToEndOn . "G$"

endfunc



endif " user_commands
