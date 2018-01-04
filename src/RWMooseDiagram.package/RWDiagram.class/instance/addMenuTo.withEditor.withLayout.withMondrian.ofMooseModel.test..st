MethodUsage-calledFromMoose
addMenuTo: aRWDiagramElementGroup withEditor: rwEditor withLayout: rwLayout withMondrian: b ofMooseModel: aMooseModel test: isTest
	b view
		@
			(RTMenuActivable
				new;
				item: 'Layout: ' , rwLayout name action: [ :e | self inform: rwLayout name ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Model: ' , aMooseModel name action: [ :e | self inform: aMooseModel name ]).
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
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel 
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
						withLayout: rwLayout
						mondrian: b
						ofMooseModel: aMooseModel 
						test: isTest ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Remember to File'
					action: [ :e | 
					rwEditor rememberRTView: b view to: rwLayout.
					RWDiagram write: b view toPath: RWDiagram path	"RWDiagram rememberWrite: e" ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Remember' action: [ :e | rwEditor rememberRTView: b view to: rwLayout	"RWDiagram rememberRTView: e" ]).
	b view
		@
			(RTMenuActivable
				new;
				item: 'Lines straight'
					action: [ :e | 
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
				item: 'Snapp to Grid'
					action: [ :e | 
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
				item: 'Remove all Highlighting' action: [ :e | RWDiagram removeTemporaryOfLayout: rwLayout ])