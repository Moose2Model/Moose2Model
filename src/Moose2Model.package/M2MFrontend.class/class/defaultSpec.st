specs
defaultSpec
	<spec: #default>
	^ SpecColumnLayout composed
		add: #menu height: self toolbarHeight; 
			"withConstraints: [ :constraints | constraints height: self toolbarHeight ];"
		add:
			(SpecRowLayout composed
				"position: 200;"
				add: #list;
				addSplitter;
				add: #pane;
				yourself);
		yourself
	"^ SpecBoxLayout newVertical
		add: #menu
			withConstraints: [ :constraints | constraints height: self toolbarHeight ];
		add:
			(SpecPanedLayout newHorizontal
				position: 200;
				add: #list;
				add: #pane;
				yourself);
		yourself"