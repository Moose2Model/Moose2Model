sourceAnchor
openLinkTo: aRWDiagramElement
	| string |
	(self hasFileInfos: aRWDiagramElement)
		ifTrue: [ OSProcess isWindows
				ifTrue: [ string := aRWDiagramElement famixElement sourceAnchor fileName.
					OSProcess command: 'cmd /C start ' , string.
					self inform: 'URL ' , string , ' is opened. In case of SAP ADT links have to be activated.' ]
				ifFalse: [ self inform: 'Sorry, links are currently supported on Windows only. Please open an issue on www.Moose2Model.org.' ] ]
		ifFalse: [ self inform: 'No Source information attached' ]