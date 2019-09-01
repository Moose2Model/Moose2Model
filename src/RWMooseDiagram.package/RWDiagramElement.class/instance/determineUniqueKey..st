accessing
determineUniqueKey: aFamixElement
	| classScopeString key |
	((self isFAMIXPackage: aFamixElement)
		or: [ self isFAMIXClass: aFamixElement ])
		ifTrue: [ key := aFamixElement class asString , '>'
				, aFamixElement moose2ModelName asString asLowercase ]
		ifFalse: [ ((self isFAMIXMethod: aFamixElement)
				or: [ self isFAMIXAttribute: aFamixElement ])
				ifTrue: [ aFamixElement hasClassScope
						ifTrue: [ classScopeString := 'cl' ]
						ifFalse: [ classScopeString := 'in' ].
					key := aFamixElement class asString , '>'
						, aFamixElement parentType moose2ModelName asString asLowercase
						, '>' , aFamixElement moose2ModelName asString asLowercase , '>'
						, classScopeString.
					key := self removeSmallTalkInfixes: key ]
				ifFalse: [ key := famixElement mooseID ] ].
	^ key