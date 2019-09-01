tests
testisFAMIXPackage
	| famixElement diagram |

	diagram := RWDiagram new.
	famixElement := FAMIXPackage new.
    self assert: (diagram isFAMIXPackage: famixElement ) equals: true.
	famixElement := FamixStPackage new.
    self assert: (diagram isFAMIXPackage: famixElement ) equals: true.
	famixElement := FamixStAttribute new.
    self assert: (diagram isFAMIXPackage: famixElement ) equals: false.
