*Moose2Model
m2mParentPackage
	"Required when models from JAVA application are analyzed where parentPackage is empty"

	self parentPackage ifNil: [ ^ self javaPackage ] ifNotNil: [ ^ parentPackage ]