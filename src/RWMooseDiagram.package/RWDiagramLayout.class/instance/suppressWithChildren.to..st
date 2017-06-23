accessing
suppressWithChildren: aBoolean to: aModelElement

	self remember: [ :attributeList | |a2| a2 := attributeList suppressWithChildren: aBoolean. a2 ] ofModel: aModelElement