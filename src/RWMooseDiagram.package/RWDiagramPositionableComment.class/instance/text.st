accessing
text
	"Returns text with CRLF for linebreaks"

	RWDiagramAnonymize anonymize
		ifTrue: [ ^ ( RWDiagramAnonymize getAnonymName: text withPrefix: 'Comment' ) copyReplaceAll: '<br>' with: String crlf ].
	^ text copyReplaceAll: '<br>' with: String crlf