readFile
readFromStreamXML: aReadStream
	| famixType comp1 comp2 compClassScope anElementGroup parsed elements x y point supressWithChildren comment commentx commenty commentPoint actsos aAC versions scopeXML suppressedXML |
	aReadStream reset.
	anElementGroup := elementGroup.
	parsed := (XMLDOMParser on: aReadStream)
		removeLimits;
		optimizeForLargeDocuments;
		preservesCDataNodes: true;
		parseDocument.
	versions := parsed allElementsNamed: #version.
	"This appears not to work, why? There is no version extracted."
	versions do: [ :version | readFileVersion := version contentString ].
	scopeXML := parsed allElementsNamed: #scope.
	scopeXML
		do: [ :s | 
			| readScope |
			readScope := s contentString.
			readScope = 'package'
				ifTrue: [ self scope: self packageScope ]
				ifFalse: [ readScope = 'class'
						ifTrue: [ self scope: self classScope ]
						ifFalse: [ readScope = 'method'
								ifTrue: [ self scope: self methodScope ]
								ifFalse: [  ] ] ] ].
	suppressedXML := parsed allElementsNamed: #suppressed.
	suppressedXML
		do: [ :s | 
			| readScope |
			readScope := s contentString.
			readScope = 'packageBox'
				ifTrue: [ self packageBoxSuppressed: true ]
				ifFalse: [ self packageBoxSuppressed: false ] ].
	elements := parsed allElementsNamed: #element.
	elements
		do: [ :element | 
			famixType := element contentStringAt: #type.
			famixType = self aFAMIXPackage
				ifTrue: [ comp1 := element contentStringAt: #package.
					comp2 := ''.
					compClassScope := false ].
			famixType = self aFAMIXClass
				ifTrue: [ comp1 := element contentStringAt: #class.
					comp2 := ''.
					compClassScope := false ].
			famixType = self aFAMIXAttribute
				ifTrue: [ comp1 := element contentStringAt: #class.
					comp2 := element contentStringAt: #attribute.
					(element contentStringAt: #hasClassScope) = #true
						ifTrue: [ compClassScope := true ]
						ifFalse: [ compClassScope := false ] ].
			famixType = self aFAMIXMethod
				ifTrue: [ comp1 := element contentStringAt: #class.
					comp2 := element contentStringAt: #method.
					(element contentStringAt: #hasClassScope) = #true
						ifTrue: [ compClassScope := true ]
						ifFalse: [ compClassScope := false ] ].
			"Position"
			x := element contentStringAt: #x.
			x = ''
				ifFalse: [ y := element contentStringAt: #y.
					point := x asNumber @ y asNumber.
					self
						remember: [ :attributeList | 
							| a2 |
							a2 := attributeList position: point.
							a2 ]
						FAMIXType: famixType
						comp1: comp1
						comp2: comp2
						compClassScope: compClassScope
						to: anElementGroup ].
			"Suppress with children"
			supressWithChildren := element contentStringAt: #supressWithChildren.
			supressWithChildren = ''
				ifFalse: [ self
						remember: [ :attributeList | 
							| a2 |
							a2 := attributeList suppressWithChildren: supressWithChildren = 'true'.
							a2 ]
						FAMIXType: famixType
						comp1: comp1
						comp2: comp2
						compClassScope: compClassScope
						to: anElementGroup ].
			comment := element contentStringAt: #comment.
			comment = ''
				ifFalse: [ self
						remember: [ :attributeList | 
							| a2 text |
							text := self cleanCDATA: comment.
							a2 := attributeList.
							a2 attributeIsSpecified
								ifFalse: [ a2 := RWDiagramAttributeList new ].
							a2 comment exists
								ifFalse: [ a2 := a2 comment: (RWDiagramLocalComment text: text) ]
								ifTrue: [ a2 comment text: text ].
							a2 ]
						FAMIXType: famixType
						comp1: comp1
						comp2: comp2
						compClassScope: compClassScope
						to: anElementGroup.
					commentx := element contentStringAt: #commentx.
					commentx = ''
						ifFalse: [ commenty := element contentStringAt: #commenty.
							commentPoint := commentx asNumber @ commenty asNumber.
							self
								remember: [ :attributeList | 
									| at |
									at := attributeList.
									at attributeIsSpecified
										ifFalse: [ at := RWDiagramAttributeList new ].
									at comment exists
										ifFalse: [ at comment: RWDiagramLocalComment new ].
									at comment position: commentPoint.
									at ]
								FAMIXType: famixType
								comp1: comp1
								comp2: comp2
								compClassScope: compClassScope
								to: anElementGroup ] ].
			actsos := element allElementsNamed: #ACTSuppressOthers.
			actsos
				do: [ :actso | 
					aAC := RWDiagramAppearanceChanger
						changeDeterminer:
							(RWDiagramACDStandard new
								includeMe: (actso contentStringAt: #includeMe) = 'true'
									usedByLayers: (actso contentStringAt: #usedByLayers) asInteger
									usingLayers: (actso contentStringAt: #usingLayers) asInteger;
								yourself)
						changeType: RWDiagramACTSuppressOthers new.
					self
						remember: [ :attributeList | 
							| a2 |
							attributeList attributeIsSpecified
								ifFalse: [ a2 := RWDiagramAttributeList new ]
								ifTrue: [ a2 := attributeList ].
							a2 appearanceChangerGroup addAppearentChanger: aAC.
							a2 ]
						FAMIXType: famixType
						comp1: comp1
						comp2: comp2
						compClassScope: compClassScope
						to: anElementGroup ] ].
	self replaceMooseEntities: RWDiagramLayout replaceMooseEntitiesUndefined