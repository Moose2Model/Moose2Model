environment
testLayoutForRTView
|editor view1 view2 view3 |
editor := RWDiagramEditor new.
editor currentLayoutName: 'A'.
view1 := RTView new.
editor currentLayout processedRTView: view1.
editor currentLayoutName: 'B'.
view2 := RTView new.
editor currentLayout processedRTView: view2.
self assert: view1 == view2 equals: false.
self assert: (editor layoutForRTView: view1 message: false) name equals: 'A'.
self assert: (editor layoutForRTView: view2 message: false) name equals: 'B'.

self assert: (editor layoutForRTView: view2 message: false) isDefined equals: true.
view3 := RTView new.
self assert: (editor layoutForRTView: view3 message: false) isDefined equals: false