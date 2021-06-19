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
					loads: #('Core');
					repository: 'github://Pillar-markup/Microdown:dev/src' ].
		spec 
			package: #'BeautifulComments'  with: [
				spec requires:  #( #'MicrodownDev') ];
			package: #'Microdown-Calypso' with: [
				spec requires:  #(#'BeautifulComments')]
		]

]
