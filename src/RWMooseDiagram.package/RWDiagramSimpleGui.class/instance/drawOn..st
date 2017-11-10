initialization
drawOn: aCanvas
	"comment stating purpose of message"

	| line |
	line := 2.
	aCanvas fillRectangle: self bounds color: myColor.
	aCanvas drawString: 'Size' at: self position + (10 @ line).
	aCanvas drawString: RWDiagramEditor uniqueInstance currentLayout elementGroup elementList size asString at: self position + (45 @ line).
	aCanvas drawString: 'Layout' at: self position + (100 @ line).
	aCanvas drawString: RWDiagramEditor uniqueInstance currentLayoutName at: self position + (150 @ line).
	aCanvas drawString: 'Moose2Model Simple Gui' at: self position + (850 @ line).
	line := line + 20.
	aCanvas drawString: 'Path' at: self position + (100 @ line).
	aCanvas drawString: RWDiagram path at: self position + (150 @ line).
	aCanvas drawString: RWDiagram new actualVersion at: self position + (850 @ line).