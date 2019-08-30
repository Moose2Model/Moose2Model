tests
fronted: frontend element: element DoContextMenu: menuEntry
	frontend rtView view elements
		do: [ :each | 
			each model asString = element
				ifTrue: [ each announcer subscriptions subscriptions
						do: [ :each2 | 
							each2 announcementClass asString = #TRMouseRightClick
								ifTrue: [ each2 subscriber actionsToTestMoose2Model
										do: [ :each3 | 
											each3 key = menuEntry
												ifTrue: [ each3 value cull: each ] ] ] ] ] ]