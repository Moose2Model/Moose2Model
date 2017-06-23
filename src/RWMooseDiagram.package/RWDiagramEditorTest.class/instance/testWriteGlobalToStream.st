initialization
testWriteGlobalToStream
	| editor gc aStream aExpectedStream aRWDiagramElementMethod1 |
	editor := RWDiagramEditor new.
	gc := RWDiagramGlobalComment text: '2016-08-22T21:14:08.555084+02:00470177'.
	gc text: 'Line 1<br>Line 2'.
	aRWDiagramElementMethod1 := RWDiagramElement famixElement: method1.
	editor addGlobalComments: gc to: aRWDiagramElementMethod1.
	gc := RWDiagramGlobalComment text: '2016-08-23T21:14:08.555084+02:00470177'.
	gc text: 'B Line 1<br>Line 2'.
	editor addGlobalComments: gc to: aRWDiagramElementMethod1.	
	aStream := ReadWriteStream on: String new.
	editor writeGlobalToStream: aStream.
	aExpectedStream := ReadWriteStream on: String new.
	aExpectedStream
		nextPutAll: '<?xml version="1.0"?>';
		crlf;
		nextPutAll: '<!--Global Comments-->';
		crlf;
		nextPutAll: '<elements>';
		crlf;
		nextPutAll: '    <element>';
		crlf;
		nextPutAll: '        <type>FAMIXMethod</type>';
		crlf;
		nextPutAll: '        <class>class1</class>';
		crlf;
		nextPutAll: '        <method>method1</method>';
		crlf;
		nextPutAll: '        <comment>';		
		crlf;
		nextPutAll: '            <id>2016-08-22T21:14:08.555084+02:00470177</id>';								
		crlf;
		nextPutAll: '            <text><![CDATA[Line 1<br>Line 2]]>';
		crlf;
		nextPutAll: '            </text>';
		crlf;
		nextPutAll: '        </comment>';	
		crlf;
		nextPutAll: '        <comment>';		
		crlf;
		nextPutAll: '            <id>2016-08-23T21:14:08.555084+02:00470177</id>';								
		crlf;
		nextPutAll: '            <text><![CDATA[B Line 1<br>Line 2]]>';
		crlf;
		nextPutAll: '            </text>';
		crlf;
		nextPutAll: '        </comment>';									
		crlf;
		nextPutAll: '    </element>';
		crlf;
		nextPutAll: '</elements>'.
	self assert: aStream equals: aExpectedStream	