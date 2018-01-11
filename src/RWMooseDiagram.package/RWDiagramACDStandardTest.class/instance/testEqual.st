tests
testEqual
	| acd acd2 IdenticalModel IdenticalPackage1 IdenticalNamespace IdenticalClass1 IdenticalMmethod1 IdenticalMethod1RWDE|
	acd := RWDiagramACDStandard new.
	acd
		includeMe: true
		usedByLayers: 1
		usingLayers: 2
		ofElement: method1RWDE.
	acd2 := RWDiagramACDStandard new.
	acd2
		includeMe: true
		usedByLayers: 1
		usingLayers: 2
		ofElement: method1RWDE.
	self assert: acd = acd2 equals: true.
		
	IdenticalModel := MooseModel new.
	IdenticalPackage1 := FAMIXPackage new name: 'package1'; mooseModel: IdenticalModel.
	IdenticalNamespace := FAMIXNamespace new name: 'Smalltalk'; mooseModel: IdenticalModel.
	IdenticalClass1 := FAMIXClass new name: 'class1'; parentPackage: IdenticalPackage1; container: IdenticalNamespace; mooseModel: IdenticalModel.
	IdenticalMmethod1 := FAMIXMethod new name: 'method1'; parentType: IdenticalClass1; mooseModel: IdenticalModel; hasClassScope: true.
	IdenticalMethod1RWDE := RWDiagramElement famixElement: IdenticalMmethod1.		
		

	acd2 := RWDiagramACDStandard new.
	acd2
		includeMe: true
		usedByLayers: 1
		usingLayers: 2
		ofElement: IdenticalMethod1RWDE.		

	self assert: acd = acd2 equals: true.
	acd2 := 1.
	self assert: acd = acd2 equals: false.
	acd2 := RWDiagramACDStandard new.
	acd2
		includeMe: true
		usedByLayers: 0
		usingLayers: 2
		ofElement: method1RWDE.
	self assert: acd = acd2 equals: false.
	acd2 := RWDiagramACDStandard new.
	acd2
		includeMe: true
		usedByLayers: 1
		usingLayers: 2
		ofElement: method2RWDE.
	self assert: acd = acd2 equals: false.
	
	
	