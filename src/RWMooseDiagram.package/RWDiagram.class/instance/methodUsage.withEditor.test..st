MethodUsage-calledFromMoose
methodUsage: aFAMIXGroup withEditor: rwEditor test: aBoolean
	" Thanks to Alexandre Bergel for the first version with Accesses to attributes
  Grouping into packages by Rainer Winkler "

	"Version from 20.05.2016
Handles the modifies DBTable to color database tables differently
	Version 23.05.2016 solve issue with missed lines
	Version 18.07.2016 major changes. No node for attribute and method anymore (reduces problems while reshaping the diagram)
"

	<duplicate_database_attr_color>
	<menuItem: 'RW Method Usages in Packages d' category: 'Visualize'>
	| b lb rwLayout allPackages displayedClasses allClassesForPackage dataBaseTables displayedAttributes |
	"Connect elements to comments"
	"b edges objects: comments; connectToAll: #mooseID."
	"b edges elements: b view elements; source: (aFAMIXGroup flatCollect: [:e | e mooseID ]) connectFrom: #mooseID to: #mooseID."
	"Now assign the arrows after all nodes are calculated"
	rwLayout := rwEditor currentLayout.
	rwLayout replaceElementsFromFAMIXGroup: aFAMIXGroup.
	rwLayout resetAppearance.
	rwLayout evaluateAppearance.
	rwLayout currentClasses: aFAMIXGroup.
	allPackages := aFAMIXGroup dAllModelPackages.
	rwEditor settings isReading
		ifTrue: [ allPackages := allPackages reject: [ :p | rwLayout isModelElementNotShownWithChildren: p ] ].
	b := RTMondrian new.
	b view @ RTZoomableView.
	rwEditor settings packageBoxSuppressed
		ifFalse: [ b shape rectangle
				withTextAbove: #dName;
				withTextColor: Color black;
				fillColor: Color transparent;
				borderColor: Color black ]
		ifTrue: [ b shape rectangle noBorder fillColor: Color transparent ].
	b
		nodes: allPackages
		forEach: [ :pack | 
			allClassesForPackage := (pack famixElement classes collect: [ :each | (each asRWDiagramElement: rwLayout) ]) intersection: aFAMIXGroup dAllClasses.
			rwEditor settings classBoxSuppressed
				ifFalse: [ b shape box noBorder
						withTextBelow: #dName;
						withTextColor: Color black;
						fillColor: rwLayout colorSchema classColor ]
				ifTrue: [ b shape box
						noBorder;
						fillColor: Color transparent ].
			displayedClasses := allClassesForPackage
				select: [ :each | (each dModifiers includesAnyOf: #(#ABAPGlobalClass #ABAPGlobalInterface #ABAPLocalClass #ABAPWebDynproComponent #ABAPProgram)) or: each dModifiers isEmpty ].
			rwEditor settings isReading
				ifTrue: [ displayedClasses := displayedClasses reject: [ :c | rwLayout isModelElementNotShownWithChildren: c ] ].
			b
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
						mondrian: b ].

			" Draw comments for classes"
			self
				drawComments: b
				modelElements: displayedClasses
				editor: rwEditor
				entity: self aFAMIXClass.



			"For the database tables"
			b shape
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
						displayedAttributes := cls dAttributes collect:[:each | (each asRWDiagramElement: rwLayout) ].
		rwEditor settings isReading
		ifTrue: [displayedAttributes := displayedAttributes reject: [ :c | rwLayout isModelElementNotShownWithChildren: c ]].
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
	" Draw comments for packages"
	self
		drawComments: b
		modelElements: allPackages
		editor: rwEditor
		entity: self aFAMIXPackage.
	b layout grid.


	"Draw arrows and lines"
	allPackages
		do: [ :pack | 
			b shape arrowedLine
				color: rwLayout colorSchema methodLineColor;
				withShorterDistanceAttachPoint.
			b shape head color: rwLayout colorSchema methodLineColor.
			b edges
				objects: aFAMIXGroup dAllMethods;
				connectToAll: [ :m | ( m famixElement queryAllOutgoingInvocations atScope: FAMIXMethod ) collect: [ :m2 | (m2 asRWDiagramElement: rwLayout) ] ].	" "
			b shape line
				color: rwLayout colorSchema attributeLineColor;
				withShorterDistanceAttachPoint.
			b edges
				elements: b view elements;
				"Use if allAccesses returns something: 
source: aFAMIXGroup allAccesses connectFrom: #from to: #variable."
					"Use if allAccesses is not working:"
					source: (RWDiagramElement new asRWDiagramElements: (pack famixElement classes flatCollect: [ :c | c incomingAccesses ])) connectFrom: #dFrom to: #dVariable ].	"Draw arrows"
	b build.
	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: 'Dependency graph'.
	lb addText: 'Layout: ', rwLayout name.
	lb addColor: rwLayout colorSchema classColor text: 'Class'.
	lb addColor: rwLayout colorSchema dataBaseTableColor text: 'Database table'.
	lb addColor: rwLayout colorSchema dataBaseAsAttributeColor text: 'Dummy Attribute for DataBase Table '.
	lb addColor: rwLayout colorSchema attributeColor text: 'Class attribute or Dummy Attribute for DataBase Table'.
	lb addColor: rwLayout colorSchema methodColor text: 'Class method'.
	lb addLineColor: rwLayout colorSchema attributeLineColor text: 'Access to attribute'.
	lb addLineColor: rwLayout colorSchema methodLineColor text: 'Invocation between methods'.
	lb build.
	RWDiagramAnonymize anonymize: false.
	^ b