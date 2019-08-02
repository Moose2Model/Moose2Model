as yet unclassified
makeDraggable: aShape pane: aPane
	"Make element draggable. See class RTDraggableView how this works in prinziple."

	aShape
		when: TRMouseDragging
		do: [ :e | 
			aShape translateBy: e step / aPane widget trachelCanvas camera scale.
			aPane widget changed ]