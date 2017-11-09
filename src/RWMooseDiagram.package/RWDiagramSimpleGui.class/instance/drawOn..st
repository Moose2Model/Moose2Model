initialization
drawOn: aCanvas
	"comment stating purpose of message"

   |line|
line := 10.
	aCanvas fillRectangle: self bounds color: myColor.
	
	aCanvas drawString: 'Moose2Model Simple Gui' at: self position +(400@line).
	
	line := line + 20.
	
	aCanvas drawString: 'Layout' at: self position +(10@line).
	aCanvas drawString: RWDiagramEditor uniqueInstance currentLayoutName  at: self position +(70@line).
	
	line := line + 20.

	aCanvas drawString: 'Size' at: self position +(10@line).
	aCanvas drawString: RWDiagramEditor uniqueInstance currentLayout elementGroup elementList size asString at: self position +(70@line).
	
	line := line + 20.
	
	aCanvas drawString: 'path' at: self position +(10@line).
	aCanvas drawString: RWDiagram path at: self position +(70@line).