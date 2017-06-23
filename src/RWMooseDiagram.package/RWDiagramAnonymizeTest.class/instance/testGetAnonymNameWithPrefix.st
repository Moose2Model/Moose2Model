as yet unclassified
testGetAnonymNameWithPrefix
	| expectedAnonymizedComment |
	RWDiagramAnonymize anonymize: true.
	expectedAnonymizedComment := 'Comment1'.
	self assert: (RWDiagramAnonymize getAnonymName: 'Global' withPrefix: 'Comment') equals: expectedAnonymizedComment.
	expectedAnonymizedComment := 'Comment<br>000000000002' copyReplaceAll: '<br>' with: String crlf.
	self assert: (RWDiagramAnonymize getAnonymName: 'Comment<br>SecondLine' withPrefix: 'Comment') equals: expectedAnonymizedComment.
	RWDiagramAnonymize anonymize: false