accessing
initializePresenter
	"whenSelectionChangedDo:"
"In Pharo 7: whenSelectionChangedDo:"
	list
		whenSelectionChanged:  [ :item | 
      "The following causes errors in Pharo 7 and appears not to be used in Pharo 5 and 6:"
			"self draw2: item.
			self changeMyTitle: item"	 ]
			
		"	list
		whenSelectionChanged:  [ :selection | 
			[ :item | 
			self draw2: item.
			self changeMyTitle: item	 ]
			
				cull: selection selectedItem ]"