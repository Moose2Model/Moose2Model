as yet unclassified
removeTemporary
	self appearanceChangers removeAllSuchThat: [ :each | each changeType isTemporary ]