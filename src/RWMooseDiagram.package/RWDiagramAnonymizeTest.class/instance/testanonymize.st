as yet unclassified
testanonymize
	self assert: RWDiagramAnonymize anonymize equals: false.
	RWDiagramAnonymize anonymize: true.
	self assert: RWDiagramAnonymize anonymize equals: true.
	RWDiagramAnonymize anonymize: false.
	self assert: RWDiagramAnonymize anonymize equals: false