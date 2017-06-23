creation
uniqueInstance
   "If instance is not yet created, create it by sending new to super, otherwise there will be an infinite loop"
	uniqueInstance ifNil: [ uniqueInstance := super new ].
	^ uniqueInstance 