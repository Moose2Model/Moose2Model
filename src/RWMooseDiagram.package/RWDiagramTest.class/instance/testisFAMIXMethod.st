tests
testisFAMIXMethod
	| famixElement diagram |

	diagram := RWDiagram new.
	famixElement := FAMIXMethod new.
    self assert: (diagram isFAMIXMethod: famixElement ) equals: true.
	famixElement := FamixStMethod new.
    self assert: (diagram isFAMIXMethod: famixElement ) equals: true.
	famixElement := FamixStAttribute new.
    self assert: (diagram isFAMIXMethod: famixElement ) equals: false.
