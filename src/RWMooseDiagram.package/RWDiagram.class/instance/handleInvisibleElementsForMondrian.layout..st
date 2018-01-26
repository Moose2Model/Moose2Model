MethodUsage-calledFromMoose
handleInvisibleElementsForMondrian: b layout: rwLayout
	b view elements
		do: [ :e | 
			e model class asString = #RWDiagramElement
				ifTrue: [ rwLayout packageBoxSuppressed
						ifTrue: [ e model famixElement class asString = #FAMIXPackage
								ifTrue: [ e announcer initialize ] ].
					e model famixElement class asString = #FAMIXClass
						ifTrue: [ rwLayout classBoxSuppressed
								ifTrue: [ e announcer initialize ].
							(e model famixElement modifiers includesAnyOf: #(#DBTable))
								ifTrue: [ e announcer initialize ] ] ] ]