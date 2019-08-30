tests
frontend: frontend DoContextMenuOnPane: menuEntry
	frontend rtView view canvas announcer subscriptions subscriptions
		do: [ :each | 
			each announcementClass asString = #TRMouseRightClick
				ifTrue: [ each subscriber actionsToTestMoose2Model
						do: [ :each3 | 
							each3 key = menuEntry
								ifTrue: [ each3 value cull: frontend rtView view ] ] ] ]