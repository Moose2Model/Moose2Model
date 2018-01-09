tests
testWriteToStream
	| layout aRTElement aStream aExpectedStream aExpectedClass1Stream aExpectedMethod1Stream aStartStream aEndStream aExpectedStream1 aExpectedStream2 |
	layout := RWDiagramLayout new.
	layout name: 'test1'.
	aRTElement := RTElement new.
	aRTElement model: class1RWDE.
	layout remember: [ :attributeList | attributeList position: (15 / 2) @ (179 / 2) ] fromRTElement: aRTElement.
	aRTElement := RTElement new.
	aRTElement model: method1RWDE.
	layout remember: [ :attributeList | attributeList position: (3 / 2) @ (5 / 2) ] fromRTElement: aRTElement.
	layout suppressWithChildren: true to: aRTElement model.
	layout comment: 'A comment' , Character cr asString , Character lf asString , 'second line' to: aRTElement model.
	layout replaceMooseEntities: true.
	(layout readAttributesFromFAMIXElement: aRTElement model) comment position: 11 @ 12.	
	layout
		addAppearanceChanger:
			(RWDiagramAppearanceChanger
				changeDeterminer:
					(RWDiagramACDStandard new
						includeMe: true
						usedByLayers: 2
						usingLayers: 1
						ofElement: aRTElement model)
				changeType: RWDiagramACTSuppressOthers new)
		to: aRTElement model.
	layout
		addAppearanceChanger:
			(RWDiagramAppearanceChanger
				changeDeterminer:
					(RWDiagramACDStandard new
						includeMe: false
						usedByLayers: 3
						usingLayers: 2
						ofElement: aRTElement model)
				changeType: RWDiagramACTSuppressOthers new)
		to: aRTElement model.
	"Do not remember texts"
	aRTElement model: ByteString new.
	layout remember: [ :attributeList | attributeList position: (3 / 2) @ (5 / 2) ] fromRTElement: aRTElement.
	aRTElement model: nil.
	layout remember: [ :attributeList | attributeList position: (3 / 2) @ (5 / 2) ] fromRTElement: aRTElement.
	
	aStream := ReadWriteStream on: String new.
	layout writeToStream: aStream.
	aExpectedClass1Stream := ReadWriteStream on: String new.
	aExpectedClass1Stream
		nextPutAll: '    <element>';
		crlf;
		nextPutAll: '        <type>FAMIXClass</type>';
		crlf;
		nextPutAll: '        <class>class1</class>';
		crlf;
		nextPutAll: '        <x>7.5</x>';
		crlf;
		nextPutAll: '        <y>89.5</y>';
		crlf;
		nextPutAll: '    </element>';
		crlf.
	aExpectedMethod1Stream := ReadWriteStream on: String new.
	aExpectedMethod1Stream
		nextPutAll: '    <element>';
		crlf;
		nextPutAll: '        <type>FAMIXMethod</type>';
		crlf;
		nextPutAll: '        <class>class1</class>';
		crlf;
		nextPutAll: '        <method>method1</method>';
		crlf;
		nextPutAll: '        <hasClassScope>true</hasClassScope>';
		crlf;
		nextPutAll: '        <x>1.5</x>';
		crlf;
		nextPutAll: '        <y>2.5</y>';
		crlf;
		nextPutAll: '        <supressWithChildren>true</supressWithChildren>';
		crlf;
		nextPutAll: '        <comment><![CDATA[A comment<br>second line]]>';
		crlf;
		nextPutAll: '        </comment>';
		crlf;
		nextPutAll: '        <commentx>11.0</commentx>';
		crlf;
		nextPutAll: '        <commenty>12.0</commenty>';
		crlf;
		nextPutAll: '        <ACTSuppressOthers>';
		crlf;
		nextPutAll: '            <type>ACDStandard</type>';
		crlf;
		nextPutAll: '            <includeMe>true</includeMe>';
		crlf;
		nextPutAll: '            <usedByLayers>2</usedByLayers>';
		crlf;
		nextPutAll: '            <usingLayers>1</usingLayers>';
		crlf;
		nextPutAll: '        </ACTSuppressOthers>';
		crlf;
		nextPutAll: '        <ACTSuppressOthers>';
		crlf;
		nextPutAll: '            <type>ACDStandard</type>';
		crlf;
		nextPutAll: '            <includeMe>false</includeMe>';
		crlf;
		nextPutAll: '            <usedByLayers>3</usedByLayers>';
		crlf;
		nextPutAll: '            <usingLayers>2</usingLayers>';
		crlf;
		nextPutAll: '        </ACTSuppressOthers>';
		crlf;
		nextPutAll: '    </element>';
		crlf.
	aStartStream := ReadWriteStream on: String new.
	aStartStream
		nextPutAll: '<?xml version="1.0"?>';
		crlf;
		nextPutAll: '<!--Moose2Model Layout data, visit moose2model.org on how to use this file-->';
		crlf;
		nextPutAll: '<elements>';
		crlf;
      nextPutAll: '    <version>v1.0.1</version>';
		crlf;
		nextPutAll: '    <scope>method</scope>';
		crlf.
	aEndStream := ReadWriteStream on: String new.
	aEndStream nextPutAll: '</elements>'.
	aExpectedStream1 := ReadWriteStream on: String new.
	aExpectedStream2 := ReadWriteStream on: String new.
aExpectedStream1
				nextPutAll: aStartStream contents;
				nextPutAll: aExpectedClass1Stream contents;
				nextPutAll: aExpectedMethod1Stream contents;
				nextPutAll: aEndStream contents .
		aExpectedStream2
				nextPutAll: aStartStream contents;
				nextPutAll: aExpectedMethod1Stream contents;
				nextPutAll: aExpectedClass1Stream contents;
				nextPutAll: aEndStream contents .
	(aStream contents = aExpectedStream1 contents) | (aStream contents = aExpectedStream2 contents)
	ifFalse:[self assert: aStream equals: aExpectedStream]
	