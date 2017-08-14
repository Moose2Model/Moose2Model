connections
setConnections
|pe1 ce1 pe2 ce2|
	elementGroup elementList
		do: [ :el | 
			el famixElement class asString = self aFAMIXMethod
				ifTrue: [ (el famixElement queryAllOutgoingInvocations atScope: FAMIXMethod) storage
						do:
							[ :m |
							pe1 := self elementGroup getElementForFAMIXElement: el famixElement parentType parentPackage.
							ce1 := self elementGroup getElementForFAMIXElement: el famixElement parentType.
							pe2 := self elementGroup getElementForFAMIXElement: m parentType parentPackage.
							ce2 := self elementGroup getElementForFAMIXElement: m parentType.
							pe1 connectedTo: pe2.
							ce1 connectedTo: ce2.
							"Now determine the FAMIX Element of the class and the package of the found method m. This is the target of the invocation. Determine class and package of the processed element el, this is the source of the found invocation. A similar logic is also to be done for the found accesses." ] ] ]