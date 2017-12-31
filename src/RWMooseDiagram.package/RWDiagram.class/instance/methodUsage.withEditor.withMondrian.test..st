MethodUsage-calledFromMoose
methodUsage: aRWDiagramElementGroup withEditor: rwEditor withMondrian: aRTMondrian test: isTest
	" Thanks to Alexandre Bergel for the first version with Accesses to attributes
  Grouping into packages by Rainer Winkler "

	"Version from 20.05.2016
Handles the modifies DBTable to color database tables differently
	Version 23.05.2016 solve issue with missed lines
	Version 18.07.2016 major changes. No node for attribute and method anymore (reduces problems while reshaping the diagram)
	Version 29.12.2017
	Support rebuilding in same Window. If aRTMondrian is nil, a new Mondrian is build otherwise an existing is rebuild.
"

	<RWDiaEdit_65>
	<RWDiaEdit_70>
	<duplicate_database_attr_color>
	<menuItem: 'RW Method Usages in Packages d' category: 'Visualize'>
	| b isRebuild lb rwLayout allPackages displayedClasses allClassesForPackage dataBaseTables displayedAttributes allMethods |
	"Connect elements to comments"
	"b edges objects: comments; connectToAll: #mooseID."
	"b edges elements: b view elements; source: (aFAMIXGroup flatCollect: [:e | e mooseID ]) connectFrom: #mooseID to: #mooseID."
	"Now assign the arrows after all nodes are calculated"
	aRTMondrian ifNil: [ isRebuild := false ] ifNotNil: [ isRebuild := true ].
	rwLayout := rwEditor currentLayout.
	isTest
		ifFalse: [ rwLayout scope = rwLayout methodScope
				ifTrue: [ rwLayout elementGroup elementList size = 0
						ifTrue: [ self popUpAllElementsDisplayed
								ifFalse: [ "Warn that runtime can be long" ^ nil ] ]
						ifFalse: [ [ rwLayout elementGroup elementList detect: [ :each | each attributeList attributeIsSpecified ] ]
								on: NotFound
								do: [ self popUpAllElementsDisplayed
										ifFalse: [ "Warn that runtime can be long" ^ nil ] ] ] ] ].
	rwLayout refresh.
	rwLayout replaceElementsFromFAMIXGroup: aRWDiagramElementGroup.
	rwLayout resetAppearance.
	rwLayout evaluateAppearance.
	allPackages := aRWDiagramElementGroup dAllModelPackages.
	rwEditor settings isReading
		ifTrue: [ allPackages := allPackages reject: [ :p | rwLayout isModelElementNotShownWithChildren: p ] ].
	isRebuild
		ifFalse: [ b := RTMondrian new ]
		ifTrue: [ b := aRTMondrian ].
	b view @ RTZoomableView.
	isRebuild
		ifFalse: [ b view
				@
					(RTMenuActivable
						new;
						item: 'Layout: ' , rwLayout name action: [ :e | self inform: rwLayout name ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Redraw in same Window'
							action: [ :e | 
							rwEditor settings displayFormatter: false.
							self
								redraw: aRWDiagramElementGroup
								view: e
								withEditor: rwEditor
								mondrian: b
								test: isTest ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Redraw in same Window with formatting info'
							action: [ :e | 
							rwEditor settings displayFormatter: true.
							self
								redraw: aRWDiagramElementGroup
								view: e
								withEditor: rwEditor
								mondrian: b
								test: isTest ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Draw again' action: [ :e | RWDiagram drawDiagram ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Draw again with formatting info' action: [ :e | RWDiagram drawDiagramWithFormattingInfo ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Remember to File' action: [ :e | RWDiagram rememberLastUsedDiagram ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Lines straight'
							action: [ :e | 
							rwLayout lineStyle: rwLayout straightLineStyle.
							self
								redraw: aRWDiagramElementGroup
								view: e
								withEditor: rwEditor
								mondrian: b
								test: isTest ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Lines multiline'
							action: [ :e | 
							rwLayout lineStyle: rwLayout multiLineStyle.
							self
								redraw: aRWDiagramElementGroup
								view: e
								withEditor: rwEditor
								mondrian: b
								test: isTest ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Lines multiline (horizontal)'
							action: [ :e | 
							rwLayout lineStyle: rwLayout multiLineStyle2.
							self
								redraw: aRWDiagramElementGroup
								view: e
								withEditor: rwEditor
								mondrian: b
								test: isTest ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Set mode to display methods, attributes, classes and packages (Default)'
							action: [ :e | 
							rwLayout scope: rwLayout methodScope.
							self
								redraw: aRWDiagramElementGroup
								view: e
								withEditor: rwEditor
								mondrian: b
								test: isTest ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Set mode to display classes and packages'
							action: [ :e | 
							rwLayout scope: rwLayout classScope.
							self
								redraw: aRWDiagramElementGroup
								view: e
								withEditor: rwEditor
								mondrian: b
								test: isTest ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Set mode to display only packages'
							action: [ :e | 
							rwLayout scope: rwLayout packageScope.
							self
								redraw: aRWDiagramElementGroup
								view: e
								withEditor: rwEditor
								mondrian: b
								test: isTest ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Activate Snapping' action: [ :e | rwLayout snapToGrid gridX: 5. rwLayout snapToGrid gridY: 5.rwLayout snapToGrid active: true ]).
			b view
				@
					(RTMenuActivable
						new;
						item: 'Deactivate Snapping' action: [ :e | rwLayout snapToGrid active: false ]) ].
	rwEditor settings packageBoxSuppressed
		ifFalse: [ b shape rectangle
				withTextAbove: #dName;
				withTextColor: Color black;
				fillColor: Color transparent;
				borderColor: Color black ]
		ifTrue: [ b shape rectangle noBorder fillColor: Color transparent ].
	self addContextMenuClassesPackages: b.
	rwLayout scope = rwLayout packageScope
		ifTrue: [ b nodes: allPackages ]
		ifFalse: [ b
				nodes: allPackages
				forEach: [ :pack | 
					"The following is problematic. dAllClasses should return correct RWDiagramElements, but pack famixElement ... asRWDiagramElement returns new RWDiagramElements that have no relation to the found connections."
					"allClassesForPackage := (pack famixElement classes collect: [ :each | each asRWDiagramElement: rwLayout ]) intersection: aRWDiagramElementGroup dAllClasses."
					allClassesForPackage := aRWDiagramElementGroup dAllClassesOfPackage: pack.
					rwEditor settings classBoxSuppressed
						ifFalse: [ b shape box noBorder
								withTextBelow: #dName;
								withTextColor: Color black;
								fillColor: rwLayout colorSchema classColor ]
						ifTrue: [ b shape box
								noBorder;
								fillColor: Color transparent ].
					self addContextMenuClassesPackages: b.
					rwLayout scope = rwLayout methodScope
						ifTrue: [ displayedClasses := allClassesForPackage select: [ :each | (each dModifiers includesAnyOf: #(#DBTable)) = false or: each dModifiers isEmpty ] ]
						ifFalse: [ displayedClasses := allClassesForPackage ].
					rwEditor settings isReading
						ifTrue: [ displayedClasses := displayedClasses reject: [ :c | rwLayout isModelElementNotShownWithChildren: c ] ].
					rwLayout scope = rwLayout classScope
						ifTrue: [ b nodes: displayedClasses forEach: [  ].
							b layout grid ]
						ifFalse: [ b
								nodes: displayedClasses
								forEach: [ :cls | 
									self
										attributesWithEditor: rwEditor
										class: cls
										layout: rwLayout
										mondrian: b.
									self
										methodsWithEditor: rwEditor
										class: cls
										layout: rwLayout
										mondrian: b ] ].
					" Draw comments for classes"
					self
						drawComments: b
						modelElements: displayedClasses
						editor: rwEditor
						entity: self aFAMIXClass.



					"For the database tables"
					rwLayout scope = rwLayout methodScope
						ifTrue: [ b shape
								box;
								fillColor: Color transparent;
								borderColor: Color transparent.
							dataBaseTables := allClassesForPackage select: [ :each | each dModifiers includes: 'DBTable' ].
							rwEditor settings isReading
								ifTrue: [ dataBaseTables := dataBaseTables reject: [ :c | rwLayout isModelElementNotShownWithChildren: c ] ].
							b
								nodes: dataBaseTables
								forEach: [ :cls | 
									"This is duplicate coding:"
									displayedAttributes := cls dAttributes collect: [ :each | each asRWDiagramElement: rwLayout ].
									rwEditor settings isReading
										ifTrue: [ displayedAttributes := displayedAttributes reject: [ :c | rwLayout isModelElementNotShownWithChildren: c ] ].
									b shape box
										noBorder;
										fillColor: Color transparent.
									b
										node: 'attributes'
										forIt: [ b shape rectangle
												if: [ :m | rwLayout highlight: m ] fillColor: rwLayout colorSchema dataBaseAsAttributeHighLighteColor;
												if: [ :m | (rwLayout highlight: m) not ] fillColor: rwLayout colorSchema dataBaseAsAttributeColor;
												width: 20;
												height: 20;
												withText: #dName;
												fontSize: 6;
												withTextColor: Color black.
											self addContextMenuAttributesMethods: b.
											b nodes: displayedAttributes.
											b layout grid.
											self
												drawComments: b
												modelElements: displayedAttributes
												editor: rwEditor
												entity: self aFAMIXAttribute.
											b layout grid ].
									b layout verticalLine ].
							b layout grid ].
					b layout grid	"So that classes are arranged as grid" ] ].
	" Draw comments for packages"
	self
		drawComments: b
		modelElements: allPackages
		editor: rwEditor
		entity: self aFAMIXPackage.
	b layout grid.
	aRWDiagramElementGroup setConnections.
	aRWDiagramElementGroup setAccesses.
	(rwLayout scope = rwLayout packageScope or: [ rwLayout scope = rwLayout classScope ])
		ifTrue: [ "Draw arrows for packages and classes"
			rwLayout lineStyle = rwLayout straightLineStyle
				ifTrue: [ b shape arrowedLine
						color: rwLayout colorSchema methodLineColor;
						withShorterDistanceAttachPoint.
					b shape head color: rwLayout colorSchema methodLineColor ].
			rwLayout lineStyle = rwLayout multiLineStyle
				ifTrue: [ b shape: RTStyledMultiLine new.
					b shape arrowHead
						color: rwLayout colorSchema methodLineColor;
						withShorterDistanceAttachPoint;
						orthoVertical.
					b shape head color: rwLayout colorSchema methodLineColor ].
			rwLayout lineStyle = rwLayout multiLineStyle2
				ifTrue: [ b shape: RTStyledMultiLine new.
					b shape arrowHead
						color: rwLayout colorSchema methodLineColor;
						withShorterDistanceAttachPoint;
						orthoHorizontal.
					b shape head color: rwLayout colorSchema methodLineColor ].
			rwLayout scope = rwLayout packageScope
				ifTrue: [ b edges
						objects: aRWDiagramElementGroup dAllModelPackages;
						connectToAll: [ :m | m connectedTo ] ]
				ifFalse: [ b edges
						objects: aRWDiagramElementGroup dAllClasses;
						connectToAll: [ :m | m connectedTo ] ].
			"Draw access line for packages and classes"
			rwLayout lineStyle = rwLayout straightLineStyle
				ifTrue: [ b shape line
						color: rwLayout colorSchema attributeLineColor;
						withShorterDistanceAttachPoint ].
			rwLayout lineStyle = rwLayout multiLineStyle
				ifTrue: [ b shape: RTStyledMultiLine new.
					b shape arrowHead
						color: rwLayout colorSchema attributeLineColor;
						withShorterDistanceAttachPoint;
						orthoVertical ].
			rwLayout lineStyle = rwLayout multiLineStyle2
				ifTrue: [ b shape: RTStyledMultiLine new.
					b shape arrowHead
						color: rwLayout colorSchema attributeLineColor;
						withShorterDistanceAttachPoint;
						orthoHorizontal ].
			rwLayout scope = rwLayout packageScope
				ifTrue: [ b edges
						objects: aRWDiagramElementGroup dAllModelPackages;
						connectToAll: [ :m | m accessedTo ] ]
				ifFalse: [ b edges
						objects: aRWDiagramElementGroup dAllClasses;
						connectToAll: [ :m | m accessedTo ] ] ].
	"Draw arrows and lines"
	allMethods := aRWDiagramElementGroup dAllMethods.
	rwEditor settings isReading
		ifTrue: [ allMethods := allMethods reject: [ :m | rwLayout isModelElementNotShownWithChildren: m ] ].
	allPackages
		do: [ :pack | 
			rwLayout lineStyle = rwLayout straightLineStyle
				ifTrue: [ b shape arrowedLine
						color: rwLayout colorSchema methodLineColor;
						withShorterDistanceAttachPoint.
					b shape head color: rwLayout colorSchema methodLineColor ].
			rwLayout lineStyle = rwLayout multiLineStyle
				ifTrue: [ b shape: RTStyledMultiLine new.
					b shape arrowHead
						color: rwLayout colorSchema methodLineColor;
						withShorterDistanceAttachPoint;
						orthoVertical.
					b shape head color: rwLayout colorSchema methodLineColor ].
			rwLayout lineStyle = rwLayout multiLineStyle2
				ifTrue: [ b shape: RTStyledMultiLine new.
					b shape arrowHead
						color: rwLayout colorSchema methodLineColor;
						withShorterDistanceAttachPoint;
						orthoHorizontal.
					b shape head color: rwLayout colorSchema methodLineColor ].
			b edges
				objects: allMethods;
				connectToAll: [ :m | (m famixElement queryAllOutgoingInvocations atScope: FAMIXMethod) collect: [ :m2 | m2 asRWDiagramElement: rwLayout ] ].	" "
			rwLayout lineStyle = rwLayout straightLineStyle
				ifTrue: [ b shape line
						color: rwLayout colorSchema attributeLineColor;
						withShorterDistanceAttachPoint ].
			rwLayout lineStyle = rwLayout multiLineStyle
				ifTrue: [ b shape: RTStyledMultiLine new.
					b shape
						color: rwLayout colorSchema attributeLineColor;
						withShorterDistanceAttachPoint;
						orthoVertical ].
			rwLayout lineStyle = rwLayout multiLineStyle2
				ifTrue: [ b shape: RTStyledMultiLine new.
					b shape
						color: rwLayout colorSchema attributeLineColor;
						withShorterDistanceAttachPoint;
						orthoHorizontal ].
			b edges
				elements: b view elements;
				"Use if allAccesses returns something: 
source: aFAMIXGroup allAccesses connectFrom: #from to: #variable."
					"Use if allAccesses is not working:"
					source: (RWDiagramElement new asRWDiagramElements: (pack famixElement classes flatCollect: [ :c | c incomingAccesses ])) connectFrom: #dFrom to: #dVariable ].	"Draw arrows"
	b build.
	lb := RTLegendBuilder new.
	lb view: b view.
	rwEditor settings displayFormatter
		ifFalse: [ lb addText: 'Dependency graph' ]
		ifTrue: [ lb addText: 'Dependency graph - Elements without permanent appearance changers are highlighted' ].
	lb addText: 'Layout: ' , rwLayout name.
	lb addColor: rwLayout colorSchema classColor text: 'Class or interface or a grouping that is mapped to class'.
	"lb addColor: rwLayout colorSchema dataBaseTableColor text: 'Database table'."
	lb addColor: rwLayout colorSchema dataBaseAsAttributeColor text: 'DataBase Table'.
	lb addColor: rwLayout colorSchema attributeColor text: '"Data" - Class or interface attribute'.
	lb addColor: rwLayout colorSchema methodColor text: '"Coding" - Class method or some element that is mapped to class method'.
	lb addLineColor: rwLayout colorSchema attributeLineColor text: 'Access to "Data" resp. attribute'.
	lb addLineColor: rwLayout colorSchema methodLineColor text: 'Invocation between "Coding" resp. methods, the arrow points to the used one'.
	lb build.
	RWDiagramAnonymize anonymize: false.
	^ b