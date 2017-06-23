as yet unclassified
changeDeterminer: aRWDiagramAppearanceChangeDeterminer changeType: aRWDiagramAppearanceChangeType
	| changer |
	changer := RWDiagramAppearanceChanger new.
	changer changeDeterminer: aRWDiagramAppearanceChangeDeterminer.
	changer changeType: aRWDiagramAppearanceChangeType.
	^ changer