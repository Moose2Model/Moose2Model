initialization
testIsDiagramElement
	self assert: (RWDiagramEditor isDiagramElement: FAMIXPackage new) equals: true.
	self assert: (RWDiagramEditor isDiagramElement: RWDiagramNoPackage new) equals: true.
	self assert: (RWDiagramEditor isDiagramElement: RWDiagramLocalComment new) equals: false.
	self assert: (RWDiagramEditor isDiagramElement: RWDiagramGlobalComment new) equals: false