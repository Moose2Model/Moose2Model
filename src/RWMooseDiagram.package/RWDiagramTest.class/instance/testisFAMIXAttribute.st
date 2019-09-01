tests
testisFAMIXAttribute
	| famixElement diagram |

	diagram := RWDiagram new.
	famixElement := FAMIXAttribute new.
    self assert: (diagram isFAMIXAttribute: famixElement ) equals: true.
	famixElement := FamixStAttribute new.
    self assert: (diagram isFAMIXAttribute: famixElement ) equals: true.
	famixElement := FamixStClass new.
    self assert: (diagram isFAMIXAttribute: famixElement ) equals: false.
