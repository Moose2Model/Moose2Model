as yet unclassified
cleanCDATA: aString
	"This solves a not yet analyzed problem after reading a CDATA from XML"

	| string |
	string := aString.

	[ ( string last = Character space or: string last = Character lf) and: string size > 2 ] whileTrue: [ string := string allButLast ].

	^ string