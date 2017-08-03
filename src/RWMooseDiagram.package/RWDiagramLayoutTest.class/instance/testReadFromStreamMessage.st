tests
testReadFromStreamMessage
	| layout aRTElement aStream tempElement |
	layout := RWDiagramLayout new.
	layout replaceMooseEntities: false.
	layout name: 'test1'.
	aStream := ReadWriteStream on: String new.
	aStream
		nextPutAll: '<?xml version="1.0"?>';
		crlf;
		nextPutAll: '<!--Moose Diagram Editor-->';
		crlf;
		nextPutAll: '<elements>';
		crlf;
		nextPutAll: '    <version>v0.3.0</version>';
		crlf;
		nextPutAll: '<element>';
		crlf;
		nextPutAll: '    <type>FAMIXClass</type>';
		crlf;
		nextPutAll: '    <class>class1</class>';
		crlf;
		nextPutAll: '    <x>10</x>';
		crlf;
		nextPutAll: '    <y>20</y>';
		crlf;
		nextPutAll: '    <supressWithChildren>false</supressWithChildren>';
		crlf;
		nextPutAll: '</element>';
		crlf;
		nextPutAll: '<element>';
		crlf;
		nextPutAll: '    <type>FAMIXMethod</type>';
		crlf;
		nextPutAll: '    <class>class1</class>';
		crlf;
		nextPutAll: '    <method>methodI0</method>';
		crlf;
		nextPutAll: '    <hasClassScope>true</hasClassScope>';
		crlf;
		nextPutAll: '    <x>110</x>';
		crlf;
		nextPutAll: '    <y>120</y>';
		crlf;
		nextPutAll: '    <supressWithChildren>true</supressWithChildren>';
		crlf;
		nextPutAll: '    <comment><![CDATA[A comment<br>second line]]>';
		crlf;
		nextPutAll: '    </comment>';
		crlf;
		nextPutAll: '    <commentx>11</commentx>';
		crlf;
		nextPutAll: '    <commenty>23</commenty>';
		crlf;
		nextPutAll: '    <ACTSuppressOthers>';
		crlf;
		nextPutAll: '        <type>ACDStandard</type>';
		crlf;
		nextPutAll: '        <includeMe>true</includeMe>';
		crlf;
		nextPutAll: '        <usedByLayers>2</usedByLayers>';
		crlf;
		nextPutAll: '        <usingLayers>1</usingLayers>';
		crlf;
		nextPutAll: '    </ACTSuppressOthers>';
		crlf;
		nextPutAll: '    <ACTSuppressOthers>';
		crlf;
		nextPutAll: '        <type>ACDStandard</type>';
		crlf;
		nextPutAll: '        <includeMe>false</includeMe>';
		crlf;
		nextPutAll: '        <usedByLayers>3</usedByLayers>';
		crlf;
		nextPutAll: '        <usingLayers>1</usingLayers>';
		crlf;
		nextPutAll: '    </ACTSuppressOthers>';
		crlf;
		nextPutAll: '</element>';
		crlf;
		nextPutAll: '<element>';
		crlf;
		nextPutAll: '    <type>FAMIXPackage</type>';
		crlf;
		nextPutAll: '    <package>package1</package>';
		crlf;
		nextPutAll: '    <x>111</x>';
		crlf;
		nextPutAll: '    <y>121</y>';
		crlf;
		nextPutAll: '</element>';
		crlf;
		nextPutAll: '</elements>'.
	aStream reset.
	aRTElement := RTElement new.
	aRTElement model: class1RWDE .
	layout suppressWithChildren: true to: class1RWDE.
	layout readFromStream: aStream readStream message: false.
	"self assert: layout readFileVersion equals: 'v0.3.0'."
	layout replaceMooseEntities: true.
	self assert: (layout readAttributesFromFAMIXElement: aRTElement model) position point equals: 10 @ 20.
	self assert: (layout readAttributesFromFAMIXElement: aRTElement model) suppressWithChildren equals: false.
	aRTElement := RTElement new.
	aRTElement model: methodI0RWDE .
	self assert: (layout readAttributesFromFAMIXElement: aRTElement model) position point equals: 110 @ 120.
	self assert: (layout readAttributesFromFAMIXElement: aRTElement model) suppressWithChildren equals: true.
	self assert: (layout readAttributesFromFAMIXElement: aRTElement model) comment text equals: 'A comment' , Character cr asString , Character lf asString , 'second line'.
	self assert: (layout readAttributesFromFAMIXElement: aRTElement model) comment position equals: 11 @ 23.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers first changeType class asString
		equals: 'RWDiagramACTSuppressOthers'.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers first changeDeterminer class asString
		equals: 'RWDiagramACDStandard'.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers first changeDeterminer includeMe
		equals: true.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers first changeDeterminer usedByLayers
		equals: 2.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers first changeDeterminer usingLayers
		equals: 1.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers second changeType class asString
		equals: 'RWDiagramACTSuppressOthers'.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers second changeDeterminer class asString
		equals: 'RWDiagramACDStandard'.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers second changeDeterminer includeMe
		equals: false.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers second changeDeterminer usedByLayers
		equals: 3.
	self
		assert: (layout readAttributesFromFAMIXElement: aRTElement model) appearanceChangerGroup appearanceChangers second changeDeterminer usingLayers
		equals: 1.
	layout evaluateAppearance.
	self assert: layout suppressOthersActive equals: true.
	layout replaceMooseEntities: true.
	tempElement := (layout readAttributesFromFAMIXElement: methodI0M1RWDE ).
	self assert: (layout readAttributesFromFAMIXElement: methodI0M1RWDE ) appearance othersAreSuppressed equals: true.	
	self assert: (layout readAttributesFromFAMIXElement: methodI0M2RWDE ) appearance othersAreSuppressed equals: false.				
	aRTElement := RTElement new.
	aRTElement model: package2RWDE .
	self assert: (layout readAttributesFromFAMIXElement: aRTElement model) attributeIsSpecified equals: false.
	aRTElement model: package1RWDE .
	self assert: (layout readAttributesFromFAMIXElement: aRTElement model) position point equals: 111 @ 121.
	layout elementGroup elementList
		do: [ :each | 
			each famixElement class asString = 'FAMIXMethod'
				ifTrue: [ self assert: each famixElement name equals: each famixElement signature ] ].
	layout replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined