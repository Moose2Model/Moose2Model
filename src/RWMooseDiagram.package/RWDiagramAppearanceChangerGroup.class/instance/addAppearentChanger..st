adding
addAppearentChanger: aRWDiagramAppearanceChanger 
   appearanceChangers ifNil: [ appearanceChangers := OrderedCollection new ].
   appearanceChangers do: [ :each | each = aRWDiagramAppearanceChanger ifTrue:[^self "Do not add a duplicate" ] ].
	appearanceChangers add: aRWDiagramAppearanceChanger  