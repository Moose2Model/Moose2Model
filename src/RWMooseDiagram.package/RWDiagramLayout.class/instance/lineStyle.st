scope
lineStyle
   lineStyle ifNil: [ lineStyle := self straightLineStyle ].
	^ lineStyle