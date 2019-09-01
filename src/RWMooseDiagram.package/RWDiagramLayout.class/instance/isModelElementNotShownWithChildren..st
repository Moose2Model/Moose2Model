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
		ifTrue: [ ( self isFAMIXPackage: aRWDiagramElement famixElement )
				ifTrue: [|classesOfPackage| classesOfPackage := aRWDiagramElement famixElement classes.
					   classesOfPackage size = 0 ifTrue:[^ false "Workaround for issue #31. In case of Java no classes are stored yet in the packages. So do not suppress packages"].
						classesOfPackage do: [ :cl | 
							(self classNotToBeShown: cl)
								ifFalse: [ ^ false ] ].
					^ true ].
			 ( self isFAMIXClass: aRWDiagramElement famixElement )
				ifTrue: [ ^ self classNotToBeShown: aRWDiagramElement ].
			 ( self isFAMIXMethod: aRWDiagramElement famixElement )
				ifTrue: [ ^ (self othersAreSuppressed: aRWDiagramElement) not ].
			 ( self isFAMIXAttribute: aRWDiagramElement famixElement )
				ifTrue: [ ^ (self othersAreSuppressed: aRWDiagramElement) not ].
			^ false ]
		ifFalse: [ ^ false ]