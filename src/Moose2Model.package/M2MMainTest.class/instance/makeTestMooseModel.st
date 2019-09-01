tests
makeTestMooseModel
|model package1 package2 namespace class1 class2 method1 method2 method3 var1 var2 var3 methodI0P2 methodI0P1 methodI0 methodI0M1 methodI0M2 methodA0 attributeA0  classNopackage  inh methodExt access acc1 inv1 inv3 ref1 inv0P2 inv0P1 inv0 inv0M1 accI0 accA0 |

	model := MooseModel new.
	
	model name: 'A MooseModel for a Unit Test'.
	
	package1 := FAMIXPackage new name: 'package1'; mooseModel: model.
	package2 := FAMIXPackage new name: 'package2'; mooseModel: model.
	namespace := FAMIXNamespace new name: 'Smalltalk'; mooseModel: model.
	class1 := FAMIXClass new name: 'class1'; parentPackage: package1; container: namespace; mooseModel: model.
	class2 := FAMIXClass new name: 'class2'; parentPackage: package2; mooseModel: model.
	classNopackage := FAMIXClass new name: 'classNopackage'; mooseModel: model.
	inh := FAMIXInheritance new subclass: class1; superclass: class2; mooseModel: model.
	method1 := FAMIXMethod new name: 'method1'; parentType: class1; mooseModel: model; hasClassScope: true.
	method2 := FAMIXMethod new name: 'method2'; parentType: class2; mooseModel: model.
	method3 := FAMIXMethod new name: 'method3'; parentType: class2; mooseModel: model.
	methodExt := FAMIXMethod new name: 'methodExt'; parentType: class2; parentPackage: package1; mooseModel: model.
	var1 := FAMIXAttribute new name: 'var1'; parentType: class2; declaredType: class1; mooseModel: model.
	var2 := FAMIXAttribute new name: 'var2'; parentType: class2; mooseModel: model.
	var3 := FAMIXLocalVariable new name: 'var3'; parentBehaviouralEntity: method2; declaredType: class1; mooseModel: model.
	access := FAMIXAccess new accessor: method1; variable: var2; mooseModel: model.
	acc1 := FAMIXAccess new accessor: method2; variable: var1; mooseModel: model.
	inv1 := FAMIXInvocation new sender: method1; addCandidate: method2; receiver: var2; mooseModel: model.
	"inv2 := FAMIXInvocation new sender: method2; addCandidate: method2; receiver: var2; mooseModel: model."
	inv3 := FAMIXInvocation new sender: method3; addCandidate: method2; receiver: var2; mooseModel: model.
	ref1 := FAMIXReference new source: method1; target: class2; mooseModel: model.
	"Test invocations"
	methodI0P2 := FAMIXMethod new name: 'methodI0P2'; parentType: class1; mooseModel: model.
	methodI0P1 := FAMIXMethod new name: 'methodI0P1'; parentType: class1; mooseModel: model.
	inv0P2 := FAMIXInvocation new sender: methodI0P2; addCandidate: methodI0P1; mooseModel: model.
	methodI0 := FAMIXMethod new name: 'methodI0'; parentType: class1; mooseModel: model; hasClassScope: true.
	inv0P1 := FAMIXInvocation new sender: methodI0P1; addCandidate: methodI0; mooseModel: model.
	methodI0M1 := FAMIXMethod new name: 'methodI0M1'; parentType: class1; mooseModel: model.
	inv0 := FAMIXInvocation new sender: methodI0; addCandidate: methodI0M1; mooseModel: model.
	methodI0M2 := FAMIXMethod new name: 'methodI0M2'; parentType: class1; mooseModel: model.
	inv0M1 := FAMIXInvocation new sender: methodI0M1; addCandidate: methodI0M2; mooseModel: model.
	"Test access to attributes"
	methodA0 := FAMIXMethod new name: 'methodA0'; parentType: class1; mooseModel: model.
	attributeA0 := FAMIXAttribute new name: 'attributeA0'; parentType: class1; mooseModel: model.
	accI0 := FAMIXAccess new accessor: methodI0; variable: attributeA0; mooseModel: model.
	accA0 := FAMIXAccess new accessor: methodA0; variable: attributeA0; mooseModel: model.
	
	"So that printing methods works correctly"
   model allMethods do: [ :m | m signature: m name ].
^model