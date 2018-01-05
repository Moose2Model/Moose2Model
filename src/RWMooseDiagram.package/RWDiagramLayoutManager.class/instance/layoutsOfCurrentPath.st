as yet unclassified
layoutsOfCurrentPath
	"comment stating purpose of message"

	| working |
	working := RWDiagram path asFileReference.
	^ (working children select: [ :e | e extension = 'xml' ]) collect: [ :e | e base ]