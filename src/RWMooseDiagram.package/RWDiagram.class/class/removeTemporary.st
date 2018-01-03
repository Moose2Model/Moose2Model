appearanceTermporary
removeTemporary
	<RWDiaEdit_1>
	| l |
	"Delete all temporary appearances"
	l := RWDiagramEditor uniqueInstance currentLayout.
	self removeTemporaryOfLayout: l