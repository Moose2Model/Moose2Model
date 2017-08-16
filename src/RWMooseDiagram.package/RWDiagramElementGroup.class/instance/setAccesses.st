initialization
setAccesses
	| pe1 ce1 pe2 ce2 |
	self elementList
		do: [ :el | 
			el famixElement class asString = self aFAMIXClass
				ifTrue: [ el famixElement methods
						do: [ :me | 
							me accesses
								do: [ :a | 
									| elParent aParent |
									elParent := el famixElement parentPackage.
									aParent := a parentType parentPackage.
									"Ignore cases when there are no parent packages"
									elParent
										ifNotNil: [ aParent
												ifNotNil: [ pe1 := self getElementForFAMIXElement: elParent.
													pe2 := self getElementForFAMIXElement: aParent.
													pe1 = pe2
														ifFalse: [ pe1 accessedTo: pe2 ] ] ].
									ce1 := self getElementForFAMIXElement: el famixElement.
									ce2 := self getElementForFAMIXElement: a parentType.
									ce1 = ce2
										ifFalse:
											[  ce1 accessedTo: ce2 ] ] ] ] ]