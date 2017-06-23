public-diagram
removeTemporary
	elementGroup elementList
		do: [ :each | 
			each attributeList attributeIsSpecified
				ifTrue:
					[ each attributeList appearanceChangerGroup removeTemporary ] ]