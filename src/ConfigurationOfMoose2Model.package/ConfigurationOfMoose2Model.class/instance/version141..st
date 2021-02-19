accessing
version141: spec
	<version: '1.4.1'>
	spec
		for: #common
		do: [ spec repository: 'http://ss3.gemstone.com/ss/Moose2Model'.
			spec
				package: 'RWMooseDiagram'
					with: 'RWMooseDiagram-RainerWinkler.1567165092';
				"Includes also fix #93"
					package: 'Moose2Model'
					with: 'Moose2Model-RainerWinkler.1567165091' ]