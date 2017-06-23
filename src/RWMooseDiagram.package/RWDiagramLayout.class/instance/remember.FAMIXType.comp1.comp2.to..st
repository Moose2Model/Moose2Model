elementGroupAccess
remember: aBlock FAMIXType: aFAMIXTypeString comp1: aComp1 comp2: aComp2 to: aRWDiagramLayout
	| newFAMIXElement newFAMIXParentElement newRWDiagramElement |
	aFAMIXTypeString = self aFAMIXClass
		ifTrue: [ newFAMIXElement := FAMIXClass new.
			newFAMIXElement name: aComp1 ].
	aFAMIXTypeString = self aFAMIXPackage
		ifTrue: [ newFAMIXElement := FAMIXPackage new.
			newFAMIXElement name: aComp1 ].
	aFAMIXTypeString = self aFAMIXMethod
		ifTrue: [ newFAMIXElement := FAMIXMethod new.
			newFAMIXElement name: aComp2.
			newFAMIXElement signature: newFAMIXElement name.
			newFAMIXParentElement := FAMIXClass new.
			newFAMIXParentElement name: aComp1.
			newFAMIXElement parentType: newFAMIXParentElement ].
	aFAMIXTypeString = self aFAMIXAttribute
		ifTrue: [ newFAMIXElement := FAMIXAttribute new.
			newFAMIXElement name: aComp2.
			newFAMIXParentElement := FAMIXClass new.
			newFAMIXParentElement name: aComp1.
			newFAMIXElement parentType: newFAMIXParentElement ].
	newFAMIXElement
		ifNotNil: [ newRWDiagramElement := RWDiagramElement famixElement: newFAMIXElement.
			elementGroup apply: aBlock toAttribute: newRWDiagramElement replace: self replaceMooseEntities "Check"  ]