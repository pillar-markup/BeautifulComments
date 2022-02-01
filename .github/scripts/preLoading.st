"This is temporal until we fix the Pharo10 build"
IceRepository registry 
	select: [ :each | #('Microdown' 'BeautifulComments') includes: each name ]
	thenDo: [ :aRepository | aRepository forget ].
"This, however, needs to stay :)"
#( 'BaselineOfBeautifulComments' 'BaselineOfMicrodown') do: [ :each | 
	(RPackageOrganizer default packageNamed: each ifAbsent: [ nil ]) 
		ifNotNil: [ :aPackage | aPackage removeFromSystem ] ].
		
"Load microdown before BC"
Metacello new
    baseline: 'Microdown';
    repository: 'github://pillar-markup/Microdown:dev/src';
    load.


