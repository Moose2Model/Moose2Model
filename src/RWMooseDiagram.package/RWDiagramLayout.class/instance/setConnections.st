connections
setConnections
	elementGroup elementList
		do: [ :el | 
			el famixElement class asString= self aFAMIXMethod
				ifTrue: [ self halt.
					(el famixElement queryAllOutgoingInvocations atScope: FAMIXMethod) storage do: [ :m | self halt. "Now determine the FAMIX Element of the class and the package of the found method m. This is the target of the invocatin. Determine class and package of the processed element el, this is the source of the found invocation. A similar logic is also to be done for the found accesses." ] ] ]