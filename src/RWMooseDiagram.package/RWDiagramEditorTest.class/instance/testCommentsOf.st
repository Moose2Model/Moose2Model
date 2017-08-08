public
testCommentsOf
	| b rwEditor comments element aRWDElement aRWDElements element2 aRWDElement2 elementM elementM2 |
	b := RTMondrian new.
	rwEditor := RWDiagramEditor new.
	"Comment classes"
	element := FAMIXClass new.
	element name: 'Class1'.
	aRWDElement := RWDiagramElement famixElement: element.
	rwEditor currentLayout comment: 'Test' to: aRWDElement.
	rwEditor addGlobalComments: (RWDiagramGlobalComment text: 'Global') to: aRWDElement.
	"Read with separate Moose Entity of same name"
	element2 := FAMIXClass new.
	element2 name: 'Class1'.
	aRWDElement2 := RWDiagramElement famixElement: element2.
	aRWDElements := OrderedCollection new.
	aRWDElements add: aRWDElement2.
	self assert: element mooseID = element2 mooseID equals: false.
	comments := rwEditor commentsOf: aRWDElements.
	self assert: (comments select: [ :each | each text = 'Global' ]) size equals: 0.
	self assert: (comments select: [ :each | each text = 'Test' ]) size equals: 1.
	self assert: (comments select: [ :each | each text = 'Else' ]) size equals: 0.
	self assert: comments first uniqueKeyOfCommentedElement equals: aRWDElement2 uniqueKey.
	"Comment methods"
		element := FAMIXClass new.
	element name: 'Class1'.
	elementM := FAMIXMethod new name: 'method1'; parentType: element.
	
	aRWDElement := RWDiagramElement famixElement: elementM.
	rwEditor currentLayout comment: 'Test' to: aRWDElement.
	rwEditor addGlobalComments: (RWDiagramGlobalComment text: 'Global') to: aRWDElement.
	"Read with separate Moose Entity of same name"
	element2 := FAMIXClass new.
	element2 name: 'Class1'.

	elementM2 := FAMIXMethod new name: 'method1'; parentType: element2.	
	aRWDElement2 := RWDiagramElement famixElement: elementM2.
	aRWDElements := OrderedCollection new.
	aRWDElements add: aRWDElement2.
	self assert: elementM mooseID = elementM2 mooseID equals: false.
	comments := rwEditor commentsOf: aRWDElements.
	self assert: (comments select: [ :each | each text = 'Global' ]) size equals: 0.
	self assert: (comments select: [ :each | each text = 'Test' ]) size equals: 1.
	self assert: (comments select: [ :each | each text = 'Else' ]) size equals: 0.
	self assert: comments first uniqueKeyOfCommentedElement equals: aRWDElement2 uniqueKey