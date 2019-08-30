tests
checkRestricted: frontend
	| count |
	"Use in an inspector on frontend:
self rtView view elements do:[:each|Transcript show: each model asString; cr ].
to get a list of all elements
self rtView view edges do:[:each|Transcript show: each model asString; cr ].
to get a list of edges"
	self assert: frontend rtView view elements size equals: 22.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'a RWDiagramElement package1 (Package)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'a RWDiagramElement a RWDiagramNoPackage'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'a RWDiagramElement class1 in Smalltalk (Class)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'a RWDiagramElement class1.attributeA0 (Attribute)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'a RWDiagramElement class1>>methodI0P1 (Method)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'a RWDiagramElement class1>>methodI0 (Method)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'a RWDiagramElement class1>>methodI0M1 (Method)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'Class (Grouping level 1)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'Box: Active system component'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'Circle: Passive system component'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'Circle: DataBase Table'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'Access to "Data" resp. attribute'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view elements
		do: [ :each | 
			each model asString = 'Arrow points to used component'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	self assert: frontend rtView view edges size equals: 3.
	count := 0.
	frontend rtView view edges
		do: [ :each | 
			each model asString = 'a RWDiagramElement class1>>methodI0 (Method)->a RWDiagramElement class1>>methodI0M1 (Method)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view edges
		do: [ :each | 
			each model asString = 'a RWDiagramElement class1>>methodI0P1 (Method)->a RWDiagramElement class1>>methodI0 (Method)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1.
	count := 0.
	frontend rtView view edges
		do: [ :each | 
			each model asString = 'a RWDiagramElement class1>>methodI0 (Method)->a RWDiagramElement class1.attributeA0 (Attribute)'
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 1