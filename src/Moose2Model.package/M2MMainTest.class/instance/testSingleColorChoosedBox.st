tests
testSingleColorChoosedBox
	"See class MenuPresenterTest how menus are accessed in test."

	"Create a single green box and test that exactly one shape is created"

	| m2m greenButton |
	m2m := M2MFrontend new.
	m2m factory colorChooser: M2MMockColorSelectorDialogWindow new.
	m2m factory colorChooser mockSelectedColor: Color blue.
	m2m openWithSpec.	"buildWithSpec."
	greenButton := (m2m mainMenu menuGroups
		select: [ :group | group menuItems first description = #White ])
		first menuItems first.
	greenButton performMenuActionWith: {}.
	self assert: m2m pane widget trachelCanvas shapes size equals: 2. "Expect 2 as there is now also a text in the Window"
	self
		assert: m2m pane widget trachelCanvas shapes second position "The box is the second element"
		equals: 5 @ 5.
	self
		assert: m2m pane widget trachelCanvas shapes second color "The box is the second element"
		equals: Color blue.
	"m2m pane widget trachelCanvas shapes inspect."
	m2m window close	"Not needed when test runs in background"