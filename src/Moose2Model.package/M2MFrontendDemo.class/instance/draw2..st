as yet unclassified
draw2: aString
	| shape |
	shape := TRBoxShape new size: 40.
	"self makeDraggable: shape."
	self
		makeDraggable: shape
		pane: pane.
	aString = 'Green'
		ifTrue: [ shape color: Color green.
			shape position: 10 @ 10 ].
	aString = 'Red'
		ifTrue: [ shape color: Color red ].
	aString = 'ChooseColor'
		ifTrue: [ | dialog |
			dialog := self factory colorChooser title: 'Choose color'.
			dialog selectedColor: Color black.
			dialog openModal.
			shape color: dialog selectedColor.
			shape position: 5 @ 5 ].
	pane widget trachelCanvas addShape: shape.
	"Required so that the changed drawing is shown"
	pane widget changed