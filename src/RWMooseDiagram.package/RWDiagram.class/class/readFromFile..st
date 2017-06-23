FileAccess
readFromFile: aFilename
	| e |
	<RWDiaEdit_13>
	<RWDiaEdit_31>
	<RWDiaEdit_43>
	"Read layout informations from file to the processed layout"
	e := RWDiagramEditor uniqueInstance.
	e setLayOutFromFilename: aFilename.
	e readFromFile: aFilename