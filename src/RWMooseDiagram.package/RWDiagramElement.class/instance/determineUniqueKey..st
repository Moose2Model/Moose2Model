accessing
determineUniqueKey: aFamixElement
	| classScopeString key |
	(aFamixElement class asString = self aFAMIXPackage or: [ aFamixElement class asString = self aFAMIXClass ])
		ifTrue: [ key := aFamixElement class asString , '>' , aFamixElement moose2ModelName asString ]
		ifFalse: [ (aFamixElement class asString = self aFAMIXMethod or: [ aFamixElement class asString = self aFAMIXAttribute ])
				ifTrue: [ aFamixElement hasClassScope
						ifTrue: [ classScopeString := 'cl' ]
						ifFalse: [ classScopeString := 'in' ].
					key := aFamixElement class asString , '>' , aFamixElement parentType moose2ModelName asString , '>' , aFamixElement moose2ModelName asString , '>' , classScopeString ]
				ifFalse: [ key := famixElement mooseID ] ].
	^ key