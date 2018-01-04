*RWMooseDiagram
moose2ModelReadLayout
	<menuItem: 'Read Layout from path and display' category: 'Moose2Model'>
	| layout working layouts index |
	working := 'C:\DataEigen\Moose-Diagram\models' asFileReference.
	layouts := (working children select: [ :e | e extension = 'xml' ]) collect: [ :e | e base ].
	index := UIManager default chooseFrom: layouts.
	index > 0
		ifTrue: [ layout := layouts at: index.
			RWDiagram readLayout: layout.
			self inform: 'Read layout:' , layout.
			self moose2ModelDependency ]