as yet unclassified
element: aFAMIXElement snap: aPoint 
   aFAMIXElement class name = self aFAMIXMethod ifTrue:[
	^self snap: aPoint].
   aFAMIXElement class name = self aFAMIXAttribute ifTrue:[
	^self snap: aPoint].
   ^aPoint