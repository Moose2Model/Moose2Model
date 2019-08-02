tests
testSingleRedBox
	"See class MenuPresenterTest how menus are accessed in test"

	"Create a single red box and test that exactly one shape is created"

	| m2m greenButton |
	m2m := M2MFrontendDemo new.
	m2m openWithSpec.	"buildWithSpec."
	greenButton := (m2m mainMenu menuGroups
		select: [ :group | group menuItems first description = #Red ]) first
		menuItems first.
	greenButton performMenuActionWith: {}.
	self assert: m2m pane widget trachelCanvas shapes size equals: 1.
	self
		assert: m2m pane widget trachelCanvas shapes first position
		equals: 0 @ 0.
	"m2m pane widget trachelCanvas shapes inspect."
	m2m window close	"Not needed when test runs in background"