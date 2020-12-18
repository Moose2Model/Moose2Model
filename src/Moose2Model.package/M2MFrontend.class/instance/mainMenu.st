accessing
mainMenu
	| aMenu |
	aMenu := MenuModel new"Pharo 7 : self newMenuBar"
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Open Help';
						icon: ( Smalltalk ui icons iconNamed: #help "Replace in Pharo 7 with: self iconNamed:");
						action: [ HelpBrowser openOn: M2MHelp ] ] ].";"

		" addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Green';
						icon: (Smalltalk ui icons iconNamed: #glamorousGreenCircle);
						action: [ self draw2: #Green ] ] ];"
		"addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'Red';
						icon: (Smalltalk ui icons iconNamed: #glamorousRedCircle);
						action: [ self draw2: #Red ] ] ];"
		"addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: nil;
						description: 'White';
						icon: (Smalltalk ui icons iconNamed: #glamorousAdd);
						action: [ self draw2: #ChooseColor ] ] ]."
	^ aMenu