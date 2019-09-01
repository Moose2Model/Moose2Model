as yet unclassified
removeSmallTalkInfixes: aString 
|st|
st := aString.
	st := aString replaceAllRegex: 'FamixSt' with: 'FAMIX'.
	st := st replaceAllRegex: 'famixst' with: 'famix'.
	^st