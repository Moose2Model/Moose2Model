public-diagram
isModelElementNotShownWithChildren: aRWDiagramElement
	"Will contain all suppressing logic if developed
	Is called from diagrams"

	<RWDiaEdit_28>
	<RWDiaEdit_29>
	aRWDiagramElement class = RWDiagramElement
		ifFalse: [ RWDiagramElementWrongTypeError signal ].
	(self isModelElementsuppressedWithChildren: aRWDiagramElement)
		ifTrue: [ ^ true ].
	self suppressOthersActive
		ifTrue: [ aRWDiagramElement famixElement class asString = self aFAMIXPackage
				ifTrue: [ aRWDiagramElement famixElement classes
						do: [ :cl | 
							(self classNotToBeShown: cl)
								ifFalse: [ ^ false ] ].
					^ true ].
			aRWDiagramElement famixElement class asString = self aFAMIXClass
				ifTrue: [ ^ self classNotToBeShown: aRWDiagramElement ].
			aRWDiagramElement famixElement class asString = self aFAMIXMethod
				ifTrue: [ ^ (self othersAreSuppressed: aRWDiagramElement) not ].
			aRWDiagramElement famixElement class asString = self aFAMIXAttribute
				ifTrue: [ ^ (self othersAreSuppressed: aRWDiagramElement) not ].
			^ false ]
		ifFalse: [ ^ false ]