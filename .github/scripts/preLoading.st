#( 'BaselineOfBeautifulComments' 'BaselineOfMicrodown') do: [ :each | 
	(RPackageOrganizer default packageNamed: each ifAbsent: [ nil ]) 
		ifNotNil: [ :aPackage | aPackage removeFromSystem ] ].
		
"Load microdown before BC"
Metacello new
    baseline: 'Microdown';
    repository: 'github://pillar-markup/Microdown:dev/src';
    load.
