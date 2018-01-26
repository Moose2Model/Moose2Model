MethodUsage-calledFromMoose
addMenuTo: aRWDiagramElementGroup withEditor: rwEditor withLayout: rwLayout withMondrian: b ofMooseModel: aMooseModel test: isTest
	b view
		@
			(RTMenuActivable
				new;
				item: 'Layout: ' , rwLayout name
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					self inform: rwLayout name ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Model: ' , aMooseModel name
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					self inform: aMooseModel name ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Redraw in same window'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwEditor settings displayFormatter: false.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Redraw in same window with formatting info'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwEditor settings displayFormatter: true.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Remember to file'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwEditor rememberRTView: b view to: rwLayout.
					RWDiagram write: b view toPath: RWDiagram path	"RWDiagram rememberWrite: e" ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Remember'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwEditor rememberRTView: b view to: rwLayout	"RWDiagram rememberRTView: e" ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Lines straight'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwEditor rememberRTView: b view to: rwLayout.
					rwLayout lineStyle: rwLayout straightLineStyle.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Lines multiline'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwEditor rememberRTView: b view to: rwLayout.
					rwLayout lineStyle: rwLayout multiLineStyle.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Lines multiline (horizontal)'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwEditor rememberRTView: b view to: rwLayout.
					rwLayout lineStyle: rwLayout multiLineStyle2.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Set mode to display methods, attributes, classes and packages (Default)'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwLayout scope: rwLayout methodScope.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Set mode to display classes and packages'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwLayout classBoxSuppressed: false.
					rwLayout scope: rwLayout classScope.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Set mode to display only packages'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwLayout packageBoxSuppressed: false.
					rwLayout scope: rwLayout packageScope.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Snap to grid'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwEditor rememberRTView: b view to: rwLayout.
					rwLayout snapToGrid gridX: 5.
					rwLayout snapToGrid gridY: 5.
					rwLayout snapToGrid active: true.
					self readToRTView: b view withEditor: RWDiagramEditor uniqueInstance withLayout: rwLayout.
					rwLayout snapToGrid active: false.
					e signalUpdate ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Remove all highlighting'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					RWDiagram removeTemporaryOfLayout: rwLayout ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'List elements of Layout to Transcript'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwLayout listWithComments: true ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'List elements of Layout to Transcript without comments'
					action: [ :e | 
					self setLayoutCurrent: rwLayout.
					rwLayout listWithComments: false ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Toogle Package display'
					action: [ :e | 
					rwLayout packageBoxSuppressed: rwLayout packageBoxSuppressed not.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Toogle Class display'
					action: [ :e | 
					rwLayout classBoxSuppressed: rwLayout classBoxSuppressed not.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Toogle arrows (Point to using component)'
					action: [ :e | 
					rwLayout displayDependencies: rwLayout displayDependencies not.
					self
						redraw: aRWDiagramElementGroup
						view: e
						withEditor: rwEditor
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel
						test: isTest ])