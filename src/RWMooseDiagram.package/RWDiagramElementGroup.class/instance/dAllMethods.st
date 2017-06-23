as yet unclassified
dAllMethods
"Returns a collection of RWDiagramElement"
	| classes methods |
	classes := self dAllClasses.
	methods := Set new.
	
	classes do: [ :each | each famixElement methods do: [:m| methods add: ( m asRWDiagramElement: self)]].
	^ methods