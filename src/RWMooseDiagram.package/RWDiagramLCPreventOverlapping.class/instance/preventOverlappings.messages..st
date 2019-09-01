as yet unclassified
preventOverlappings: aRTView messages: aBoolean
	| es es2 somethingDone counter |
	es := Set new.
	es2 := Set new.
	counter := self maxChecks.
	aRTView elements
		do: [ :element | 
			element model class = RWDiagramElement
				ifTrue: [ (((self isFAMIXMethod: element model famixElement)
						or: [ self isFAMIXAttribute: element model famixElement ])
						or: [ element model famixElement class
								inheritsFrom: RWDiagramAbstractComment ])
						ifTrue: [ es add: element.
							es2 add: element ]
 ] ].
	self repeat
		timesRepeat: [ somethingDone := false.
			es
				do: [ :e | 
					es2
						do: [ :e2 | 
							e = e2
								ifFalse: [ | dx minDx |
									dx := e position x - e2 position x.
									minDx := e width / 2 + (e2 width / 2) + self space.
									dx abs < minDx
										ifTrue: [ | dy minDy |
											dy := e position y - e2 position y.
											minDy := e height / 2 + (e2 height / 2) + self space.
											dy abs < minDy
												ifTrue: [ e translateTo: e position x @ (e2 position y + minDy).
													somethingDone := true ] ] ].
							counter := counter - 1.
							counter < 0
								ifTrue: [ UIManager default
										alert:
											'prevent Overlapping stoped after ' , self maxChecks asString
												,
													' steps. Call RWDiagram lCPOMaxChecks: x. where x is a higher number if needed. Runtime may be long!'.
									^ self ] ] ].
			somethingDone
				ifFalse: [ aBoolean
						ifTrue: [ self inform: 'prevent Overlapping finished' ].
					^ self ] ].
	aBoolean
		ifTrue: [ UIManager default
				alert:
					'Not all overlapping elements might be moved after '
						, self repeat asString
						,
							'loops, you may call RWDiagram lCPORepeat: x where x is a higher number of loops.' ]