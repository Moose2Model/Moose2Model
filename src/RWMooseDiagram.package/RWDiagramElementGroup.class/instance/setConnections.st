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
									pe1 := self getElementForFAMIXElement: el famixElement parentPackage.
									ce1 := self getElementForFAMIXElement: el famixElement.
									pe2 := self getElementForFAMIXElement: m parentType parentPackage.
									ce2 := self getElementForFAMIXElement: m parentType.
									pe1 = pe2
										ifFalse: [ pe1 connectedTo: pe2 ].
									ce1 = ce2
										ifFalse: [ "Now determine the FAMIX Element of the class and the package of the found method m. This is the target of the invocation. Determine class and package of the processed element el, this is the source of the found invocation. A similar logic is also to be done for the found accesses." ce1 connectedTo: ce2 ] ] ] ] ]