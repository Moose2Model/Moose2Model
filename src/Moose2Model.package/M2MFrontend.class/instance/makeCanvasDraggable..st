accessing
makeCanvasDraggable: aCanvas
	"See class RTDraggableView how this is done
This makes it possible to dragg the pane with the mouse "

	aCanvas
		when: TRMouseDragging
		do: [ :e | 
			aCanvas camera translateBy: e step negated / aCanvas camera scale.
			pane widget changed ]