as yet unclassified
id: aString
"Generate instances of global comment when the comment is read. In that case the id is read also."
	| co |
	co := super new.
	co id: aString.
	^ co