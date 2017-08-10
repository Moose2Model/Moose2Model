accessing
determineUniqueKey
	| classScopeString |
	(famixElement class asString = self aFAMIXPackage
		or: [ famixElement class asString = self aFAMIXClass ])
		ifTrue: [ uniqueKey := famixElement class asString , '>'
				, famixElement name asString ]
		ifFalse: [ (famixElement class asString = self aFAMIXMethod
				or: [ famixElement class asString = self aFAMIXAttribute ])
				ifTrue: [ famixElement hasClassScope
						ifTrue: [ classScopeString := 'cl' ]
						ifFalse: [ classScopeString := 'in' ].
					uniqueKey := famixElement class asString , '>'
						, famixElement parentType name asString , '>'
						, famixElement name asString , '>' , classScopeString ]
				ifFalse: [ uniqueKey := famixElement mooseID ] ]