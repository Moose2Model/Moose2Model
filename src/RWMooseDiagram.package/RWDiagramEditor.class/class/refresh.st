creation
refresh
   "Refresh application. Create it by sending new to super, otherwise there will be an infinite loop"
	uniqueInstance := super new.
	^ uniqueInstance 