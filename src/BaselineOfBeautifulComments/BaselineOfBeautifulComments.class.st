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
			baseline: 'Microdown'
			with: [
				spec
					repository: 'github://pillar-markup/Microdown:v2.4.1/src';
					loads: #('RichText') ].
		spec 
			package: #'BeautifulComments'  with: [
				spec requires:  #( 'Microdown') ] ]

]
