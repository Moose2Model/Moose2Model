private
famixElement: aFAMIXElement
	"Call me only from RWDiagramElementGroup"

	| el |
	el := super new.
	el famixElement: aFAMIXElement.
	^ el