as yet unclassified
element: aFAMIXElement snap: aPoint 
   aFAMIXElement class moose2ModelName = self aFAMIXMethod ifTrue:[
	^self snap: aPoint].
   aFAMIXElement class moose2ModelName = self aFAMIXAttribute ifTrue:[
	^self snap: aPoint].
   ^aPoint