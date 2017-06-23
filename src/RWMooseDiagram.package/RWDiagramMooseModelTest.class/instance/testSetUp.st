as yet unclassified
testSetUp
	"Copied from setUp of class MooseQueryTest"

	self assert: methodI0 class asString equals: 'FAMIXMethod'.

	model allMethods do: [ :m | self assert: m name equals: m signature ]