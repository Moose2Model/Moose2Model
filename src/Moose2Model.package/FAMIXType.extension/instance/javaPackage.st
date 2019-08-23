*Moose2Model
javaPackage
	| stream string re pname |
	"Required when models from JAVA application are analyzed where parentPackage is empty"
	stream := '' writeStream.
	self container
		ifNotNil: [ self container mooseNameOn: stream.
			string := stream contents.
			re := '\:\:' asRegex.
			pname := re copy: string replacingMatchesWith: '.' ]
		ifNil: [ ^ nil ].
	^ FAMIXPackage new name: pname