accessing
determineUniqueKey: aFamixElement
	| classScopeString key |
	(aFamixElement class asString = self aFAMIXPackage or: [ aFamixElement class asString = self aFAMIXClass ])
		ifTrue: [ key := aFamixElement class asString , '>' , aFamixElement moose2ModelName asString asLowercase ]
		ifFalse: [ (aFamixElement class asString = self aFAMIXMethod or: [ aFamixElement class asString = self aFAMIXAttribute ])
				ifTrue: [ aFamixElement hasClassScope
						ifTrue: [ classScopeString := 'cl' ]
						ifFalse: [ classScopeString := 'in' ].
					key := aFamixElement class asString , '>' , aFamixElement parentType moose2ModelName asString asLowercase, '>' , aFamixElement moose2ModelName asString asLowercase  , '>' , classScopeString ]
				ifFalse: [ key := famixElement mooseID ] ].
	^ key