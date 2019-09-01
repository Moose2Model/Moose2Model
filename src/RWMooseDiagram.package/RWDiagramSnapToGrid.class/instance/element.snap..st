as yet unclassified
element: aFAMIXElement snap: aPoint 
    ( self isFAMIXMethod: aFAMIXElement ) ifTrue:[
	^self snap: aPoint].
    ( self isFAMIXAttribute: aFAMIXElement ) ifTrue:[
	^self snap: aPoint].
   ^aPoint