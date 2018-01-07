as yet unclassified
readLayout: aString ofMooseModel: aMooseModel
	| e |
	path = ''
		ifTrue: [ path := nil ].
	path
		ifNil: [ self inform: 'Specify a global path using contect menu of Model, Moose2Model -> Set path to Layouts' ]
		ifNotNil: [ e := RWDiagramEditor uniqueInstance.
			"Specify the Layout to be processed"
			e currentLayoutName: aString.
			e currentLayout refresh.
			e currentLayout mooseID = aMooseModel mooseID
				ifFalse: [ e refreshLayout: e currentLayout.
					e currentLayout mooseID: aMooseModel mooseID ].
			self readFromPath: path.
			self inform: 'Layout: ' , aString , ' was read from path ' , path ]