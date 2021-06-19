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
					repository: 'github://Pillar-markup/Microdown/src' ].
		spec 
			package: #'Beautiful-Comments'  with: [
				spec requires:  #( #'MicrodownDev') ];
			package: #'Microdown-Calypso' with: [
				spec requires:  #(#'Beautiful-Comments')]
		]

]
