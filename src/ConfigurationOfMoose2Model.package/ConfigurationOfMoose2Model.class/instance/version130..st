accessing
version130: spec
<version: '1.3.0'>

spec for: #'pharo6.x' do: [ 
	spec repository: 'http://www.smalltalkhub.com/mc/RainerWinkler/RW-Moose-Diagram/main'.
	"
	Outcomment dependency from Moose Model as it is not loading
	spec project: 'Moose ALL' with: [ 
		   spec repository: 'http://www.smalltalkhub.com/mc/Moose/Moose/main';
		        className: #ConfigurationOfMoose;
		        versionString: #'development' ]."
		 
	spec package: 'RWMooseDiagram' with: 'RWMooseDiagram-RainerWinkler.1565352280';
	     package: 'Moose2Model' with: 'Moose2Model-RainerWinkler.1565352280' ].