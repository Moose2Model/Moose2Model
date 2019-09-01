tests
testisFAMIXClass
	| famixElement diagram |

	diagram := RWDiagram new.
	famixElement := FAMIXClass new.
    self assert: (diagram isFAMIXClass: famixElement ) equals: true.
	famixElement := FamixStClass new.
    self assert: (diagram isFAMIXClass: famixElement ) equals: true.
	famixElement := FamixStAttribute new.
    self assert: (diagram isFAMIXClass: famixElement ) equals: false.
