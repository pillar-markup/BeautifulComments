Class {
	#name : #BaselineOfBeautifulComments,
	#superclass : #BaselineOf,
	#category : #BaselineOfBeautifulComments
}

{ #category : #baselines }
BaselineOfBeautifulComments >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'MicrodownDev'
			with: [
				spec
					loads: #('RichText');
					repository: 'github://Pillar-markup/Microdown:dev/src' ].
		spec 
			package: #'BeautifulComments-Calypso'  with: [
				spec requires:  #( #'MicrodownDev') ]
		]

]
