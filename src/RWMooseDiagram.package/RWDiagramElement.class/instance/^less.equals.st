as yet unclassified
<= aRWDiagramElement 
	|stream1 stream2 s1 s2|
	stream1 := WriteStream on: String new.
	stream2 := WriteStream on: String new.
	self famixElement printOn: stream1.
	aRWDiagramElement famixElement printOn: stream2.
	s1 := stream1 contents.
	s2 := stream2 contents.
	
^(s1 <= s2)