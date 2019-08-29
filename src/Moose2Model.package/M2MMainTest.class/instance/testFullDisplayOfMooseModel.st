tests
testFullDisplayOfMooseModel
	"This tests that an explicitely created Moose Model is displayed correctly.
	1. Create a Moosemode
	2. Display it completely in the forntend
	3. Search for a certain method and add it and only neighbours to diagram
	4. Clear the frontend and open the diagram again (Do not read from file but from the remembered informations)
	5. CHeck that now only a restricted number of elements is shown"

|model package1 package2 namespace class1 class2 inh method1 method2 method3 methodExt var1 var2 var3 access acc1 inv1 inv2 inv3 ref1 methodI0P2 methodI0P1 inv0P2 methodI0 inv0P1 methodI0M1 inv0 methodI0M2 inv0M1 methodA0 attributeA0 accA0 accI0 package1RWDE package2RWDE class1RWDE class2RWDE method1RWDE method2RWDE method3RWDE var1RWDE var2RWDE var3RWDE methodI0RWDE methodI0P2RWDE methodI0P1RWDE methodI0M1RWDE methodI0M2RWDE attributeA0RWDE classNopackage classNopackageRWDE frontend count|


   RWDiagram automaticTestIsRunning: true.

	model := MooseModel new.
	package1 := FAMIXPackage new name: 'package1'; mooseModel: model.
	package1RWDE := RWDiagramElement famixElement: package1.
	package2 := FAMIXPackage new name: 'package2'; mooseModel: model.
	package2RWDE := RWDiagramElement famixElement: package2.
	namespace := FAMIXNamespace new name: 'Smalltalk'; mooseModel: model.
	class1 := FAMIXClass new name: 'class1'; parentPackage: package1; container: namespace; mooseModel: model.
	class1RWDE := RWDiagramElement famixElement: class1.
	class2 := FAMIXClass new name: 'class2'; parentPackage: package2; mooseModel: model.
	class2RWDE := RWDiagramElement famixElement: class2.
	classNopackage := FAMIXClass new name: 'classNopackage'; mooseModel: model.
	classNopackageRWDE := RWDiagramElement famixElement: classNopackage.
	inh := FAMIXInheritance new subclass: class1; superclass: class2; mooseModel: model.
	method1 := FAMIXMethod new name: 'method1'; parentType: class1; mooseModel: model; hasClassScope: true.
	method1RWDE := RWDiagramElement famixElement: method1.
	method2 := FAMIXMethod new name: 'method2'; parentType: class2; mooseModel: model.
	method2RWDE := RWDiagramElement famixElement: method2.
	method3 := FAMIXMethod new name: 'method3'; parentType: class2; mooseModel: model.
	method3RWDE := RWDiagramElement famixElement: method3.
	methodExt := FAMIXMethod new name: 'methodExt'; parentType: class2; parentPackage: package1; mooseModel: model.
	var1 := FAMIXAttribute new name: 'var1'; parentType: class2; declaredType: class1; mooseModel: model.
	var1RWDE := RWDiagramElement famixElement: var1.
	var2 := FAMIXAttribute new name: 'var2'; parentType: class2; mooseModel: model.
	var2RWDE := RWDiagramElement famixElement: var2.
	var3 := FAMIXLocalVariable new name: 'var3'; parentBehaviouralEntity: method2; declaredType: class1; mooseModel: model.
	var3RWDE := RWDiagramElement famixElement: var3.
	access := FAMIXAccess new accessor: method1; variable: var2; mooseModel: model.
	acc1 := FAMIXAccess new accessor: method2; variable: var1; mooseModel: model.
	inv1 := FAMIXInvocation new sender: method1; addCandidate: method2; receiver: var2; mooseModel: model.
	"inv2 := FAMIXInvocation new sender: method2; addCandidate: method2; receiver: var2; mooseModel: model."
	inv3 := FAMIXInvocation new sender: method3; addCandidate: method2; receiver: var2; mooseModel: model.
	ref1 := FAMIXReference new source: method1; target: class2; mooseModel: model.
	"Test invocations"
	methodI0P2 := FAMIXMethod new name: 'methodI0P2'; parentType: class1; mooseModel: model.
	methodI0P2RWDE := RWDiagramElement famixElement: methodI0P2.
	methodI0P1 := FAMIXMethod new name: 'methodI0P1'; parentType: class1; mooseModel: model.
	methodI0P1RWDE := RWDiagramElement famixElement: methodI0P1.
	inv0P2 := FAMIXInvocation new sender: methodI0P2; addCandidate: methodI0P1; mooseModel: model.
	methodI0 := FAMIXMethod new name: 'methodI0'; parentType: class1; mooseModel: model; hasClassScope: true.
	methodI0RWDE := RWDiagramElement famixElement: methodI0.
	inv0P1 := FAMIXInvocation new sender: methodI0P1; addCandidate: methodI0; mooseModel: model.
	methodI0M1 := FAMIXMethod new name: 'methodI0M1'; parentType: class1; mooseModel: model.
	methodI0M1RWDE := RWDiagramElement famixElement: methodI0M1.
	inv0 := FAMIXInvocation new sender: methodI0; addCandidate: methodI0M1; mooseModel: model.
	methodI0M2 := FAMIXMethod new name: 'methodI0M2'; parentType: class1; mooseModel: model.
	methodI0M2RWDE := RWDiagramElement famixElement: methodI0M2.
	inv0M1 := FAMIXInvocation new sender: methodI0M1; addCandidate: methodI0M2; mooseModel: model.
	"Test access to attributes"
	methodA0 := FAMIXMethod new name: 'methodA0'; parentType: class1; mooseModel: model.
	attributeA0 := FAMIXAttribute new name: 'attributeA0'; parentType: class1; mooseModel: model.
	attributeA0RWDE := RWDiagramElement famixElement: attributeA0.
	accI0 := FAMIXAccess new accessor: methodI0; variable: attributeA0; mooseModel: model.
	accA0 := FAMIXAccess new accessor: methodA0; variable: attributeA0; mooseModel: model.
	
	"So that printing methods works correctly"
   model allMethods do: [ :m | m signature: m name ].
   model moose2ModelRefresh.
   frontend := model moose2ModelDependency.
   self assert: frontend rtView view elements size equals: 34.
"Use in an inspector on frontend:
self rtView view elements do:[:each|Transcript show: each model asString; cr ].
to get a list of all elements
self rtView view edges do:[:each|Transcript show: each model asString; cr ].
to get a list of edges"

"Check all elements"
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement package2 (Package)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. "There has to be at least a single correctly named element"
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement a RWDiagramNoPackage' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement package1 (Package)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class2 (Class)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class2.var1 (Attribute)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class2.var2 (Attribute)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class2>>method2 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class2>>method3 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class2>>methodExt (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement classNopackage (Class)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1 in Smalltalk (Class)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1.attributeA0 (Attribute)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>method1 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0P2 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0P1 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0M1 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0M2 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodA0 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
"The next elements belong to the legend"
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Class (Grouping level 1)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Box: Active system component' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Circle: Passive system component' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Circle: DataBase Table' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Access to "Data" resp. attribute' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Arrow points to used component' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 

"Check all edges"
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>method1 (Method)->a RWDiagramElement class2>>method2 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0P2 (Method)->a RWDiagramElement class1>>methodI0P1 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0P1 (Method)->a RWDiagramElement class1>>methodI0 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0 (Method)->a RWDiagramElement class1>>methodI0M1 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0M1 (Method)->a RWDiagramElement class1>>methodI0M2 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class2>>method3 (Method)->a RWDiagramElement class2>>method2 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>method1 (Method)->a RWDiagramElement class2.var2 (Attribute)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class2>>method2 (Method)->a RWDiagramElement class2.var1 (Attribute)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>methodA0 (Method)->a RWDiagramElement class1.attributeA0 (Attribute)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0 (Method)->a RWDiagramElement class1.attributeA0 (Attribute)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 

"Navigate to methodI0 and perform a right mouseclick on 'Add with neighbours'."

frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0 (Method)' ifTrue:[ each announcer subscriptions subscriptions do: [ :each2 | each2 announcementClass asString = #TRMouseRightClick ifTrue:[each2 subscriber actionsToTestMoose2Model do:[:each3|each3 key = 'Add with neighbours' ifTrue:[ each3 value cull: each ] ] ]   ] ] ].

"Close the frontend"

frontend window close.

"Open it again"

frontend := model moose2ModelDependency.

"Now only a restricted list of elements is displayed"

"frontend inspect."

"Check elements"

self assert: frontend rtView view elements size equals: 22.
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement package1 (Package)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement a RWDiagramNoPackage' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1 in Smalltalk (Class)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1.attributeA0 (Attribute)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0P1 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0M1 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
"The legend"
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Class (Grouping level 1)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Box: Active system component' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Circle: Passive system component' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Circle: DataBase Table' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Access to "Data" resp. attribute' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view elements do:[:each| each model asString = 'Arrow points to used component' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 

"Check edges"

self assert: frontend rtView view edges size equals: 3.

count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0 (Method)->a RWDiagramElement class1>>methodI0M1 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0P1 (Method)->a RWDiagramElement class1>>methodI0 (Method)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 
count  := 0.
frontend rtView view edges do:[:each| each model asString = 'a RWDiagramElement class1>>methodI0 (Method)->a RWDiagramElement class1.attributeA0 (Attribute)' ifTrue:[count := count + 1 ]].
self assert: count equals: 1. 

frontend window close
