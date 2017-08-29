initialization
setConnections
	| pe1 ce1 pe2 ce2 |
	"Refresh all connections before settings"
	self elementList
		do: [ :el | 
			el famixElement class asString = self aFAMIXClass
				ifTrue: [ el famixElement methods
						do: [ :me | 
							(me queryAllOutgoingInvocations atScope: FAMIXMethod) storage
								do: [ :m | 
									| elParent mParent |
									elParent := el famixElement m2mParentPackage.
									mParent := m parentType m2mParentPackage.
									"Ignore cases when there are no parent packages"
									elParent
										ifNotNil: [ mParent
												ifNotNil: [ pe1 := self getElementForFAMIXElement: elParent.
													pe2 := self getElementForFAMIXElement: mParent.
													pe1 = pe2
														ifFalse: [ pe1 connectedTo: pe2 ] ] ].
									ce1 := self getElementForFAMIXElement: el famixElement.
									ce2 := self getElementForFAMIXElement: m parentType.
									ce1 = ce2
										ifFalse:
											[ "Now determine the FAMIX Element of the class and the package of the found method m. This is the target of the invocation. Determine class and package of the processed element el, this is the source of the found invocation. A similar logic is also to be done for the found accesses." ce1 connectedTo: ce2 ] ] ] ] ]