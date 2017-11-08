adaptNewDiagram
drawDiagram
	| e |
	e := RWDiagramEditor uniqueInstance.	
   self inform: 'Elements without appearance changers will be hightlighted. Use to find out where a statement like "RWDiagram suppressOthersUsedByLayers: 1 usingLayers: 1 to: self." is needed.'.
	e settings displayFormatter: false.
	e lastUsedClassGroup generateMoose2ModelDiagram