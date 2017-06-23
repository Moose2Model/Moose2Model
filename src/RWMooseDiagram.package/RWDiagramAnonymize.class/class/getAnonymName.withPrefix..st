as yet unclassified
getAnonymName: aClearName withPrefix: aPrefix
	| numberString l numberLength numberOfZeros zeros newName prefixLength positionOfFirstLineBreak |
	l := aClearName size.
	positionOfFirstLineBreak := 0.
	positionOfFirstLineBreak := aClearName indexOfAnyOf: '<'.
	number ifNil: [ number := 1 ].
	numberString := number asString.
	numberLength := numberString size.
	prefixLength := aPrefix size.
	numberOfZeros := l - prefixLength - numberLength.
	zeros := ''.
	numberOfZeros > 0
		ifTrue: [ numberOfZeros timesRepeat: [ zeros := zeros , $0 asString ] ].
	newName := aPrefix , zeros , number asString.
	number := number + 1.
	positionOfFirstLineBreak > 0
		ifTrue: [ newName
				replaceFrom: positionOfFirstLineBreak
				to: positionOfFirstLineBreak + 1
				with: String crlf
				startingAt: 1 ].
	^ newName