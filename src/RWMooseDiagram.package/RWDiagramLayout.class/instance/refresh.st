refreshing
refresh
   "Replaces all FAMIXElements with nil, to make sure that all used FAMIXElements are correctly read from actual data"
	elementGroup elementList do: [ :el | el refresh ]