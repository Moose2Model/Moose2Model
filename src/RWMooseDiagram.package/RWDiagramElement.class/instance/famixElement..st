accessing
famixElement: aFAMIXElement
	| classScopeString |
	(RWDiagramEditor isDiagramElement: aFAMIXElement)
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	famixElement := aFAMIXElement.
	(famixElement class asString = self aFAMIXPackage or: [ famixElement class asString = self aFAMIXClass ])
		ifTrue: [ uniqueKey := famixElement class asString , '>' , famixElement name asString ]
		ifFalse: [ (famixElement class asString = self aFAMIXMethod or: [ famixElement class asString = self aFAMIXAttribute ])
				ifTrue: [ famixElement hasClassScope
						ifTrue: [ classScopeString := 'cl' ]
						ifFalse: [ classScopeString := 'in' ].
					uniqueKey := famixElement class asString , '>' , famixElement parentType name asString , '>' , famixElement name asString , '>' , classScopeString ]
				ifFalse: [ uniqueKey := famixElement mooseID ] ].

	"Set list with hash"
	famixElementHash ifNil: [ famixElementHash := Dictionary new ].
	lastHash ifNil: [ lastHash := 0 ].
	[famixElementHash at: uniqueKey] on: KeyNotFound do: [ lastHash := lastHash + 1. famixElementHash at: uniqueKey put: lastHash ]. 
"Set list with elements by key"
famixElementByUniqueKey ifNil: [ famixElementByUniqueKey := Dictionary new ].
[ famixElementByUniqueKey at: uniqueKey ] on: KeyNotFound do: [ famixElementByUniqueKey at: uniqueKey put: self ]