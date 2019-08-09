accessing
initializePresenter
	"whenSelectionChangedDo:"
"In Pharo 7: whenSelectionChangedDo:"
	list
		whenSelectionChanged:  [ :item | 
			self draw2: item.
			self changeMyTitle: item	 ]
			
		"	list
		whenSelectionChanged:  [ :selection | 
			[ :item | 
			self draw2: item.
			self changeMyTitle: item	 ]
			
				cull: selection selectedItem ]"