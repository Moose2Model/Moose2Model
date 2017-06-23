accessing
text: aString
	"Accepts texts with CRLF, <br> and -Linebreak-"

	"Stores with <br>"

	| string |
	string := aString copyReplaceAll: '-Linebreak-' with: '<br>'.
	string := string copyReplaceAll: String crlf with: '<br>'.
	text := string