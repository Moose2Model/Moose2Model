accessing
suppressOthersActive
	suppressOthersActive ifNil: [ suppressOthersActive := false ].
	^ suppressOthersActive