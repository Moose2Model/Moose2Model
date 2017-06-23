public
testReadToRTViewMessages
	| editor v c e |
	"This test shall fail"
	editor := RWDiagramEditor new.
	v := RTView new.
	c := RWDiagramLocalComment new.
	e := RTElement new.
	e model: c.
	v add: e.
	e := RTElement new.
	e model: class1RWDE.	
	v add: e.
	editor readToRTView: v messages: false.
	self assert: 1 equals: 2