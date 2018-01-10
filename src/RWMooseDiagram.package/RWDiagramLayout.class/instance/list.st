list
list
	"Write informations about the current diagram view to Transcript"

	<RWDiaEdit_56>
	<RWDiaEdit_57>
	<RWDiaEdit_58>
	| stream return streamElement streamInfos |
	stream := WriteStream on: String new.
	return := String crlf.
	stream
		nextPutAll: '--------------------------------------------------------------------';
		nextPutAll: return;
		nextPutAll: 'Diagram Layout View: ';
		nextPutAll: self name;
		nextPutAll: return;
		nextPutAll: return.
	elementGroup elementList asSortedCollection
		do: [ :each | 
			each attributeList attributeIsSpecified
				ifTrue: [ streamInfos := WriteStream on: String new.
					each attributeList suppressWithChildren
						ifTrue: [ streamInfos nextPutAll: ' Suppress with children ' ].
					each attributeList appearanceChangerGroup appearanceChangers
						do: [ :ac | 
							streamInfos nextPut: Character space.
							ac changeType class asString = 'RWDiagramACTSuppressOthers'
								ifTrue: [ ac changeDeterminer includeMe
										ifTrue: [ streamInfos nextPutAll: 'Display ' ]
										ifFalse: [ streamInfos nextPutAll: 'Neighbours displayed ' ].
									streamInfos nextPutAll: 'used ' , ac changeDeterminer usedByLayers asString , ' using ' , ac changeDeterminer usingLayers asString , ' ' ]
								ifFalse: [ ac changeType printOn: streamInfos.
									streamInfos nextPut: Character space.
									ac changeDeterminer printOn: streamInfos ] ].
					each attributeList comment exists
						ifTrue: [ streamInfos nextPutAll: 'Comment:'.
							streamInfos nextPutAll: return.
							streamInfos nextPutAll: each attributeList comment text ].
					"Print element only if at least something is to be printed for it"
					streamInfos size = 0
						ifFalse: [ streamElement := WriteStream on: String new.
							streamElement nextPutAll: '- '.
							each famixElement printOn: streamElement.
							"Position infos below each other for better readability"
							streamElement size < self elementListLength
								ifTrue: [ | l |
									l := self elementListLength - streamElement size.
									l timesRepeat: [ streamElement nextPut: Character space ] ].
							each famixElement
								ifNil: [ stream
										nextPutAll: '- Element in xml but not in Model:';
										nextPutAll: each uniqueKey ]
								ifNotNil: [ stream nextPutAll: streamElement contents ].
							stream
								nextPutAll: streamInfos contents;
								nextPutAll: return ] ] ].
	stream size = 0
		ifTrue: [ Transcript
				cr;
				show: 'Nothing to display' ]
		ifFalse: [ Transcript
				cr;
				show: stream contents ]