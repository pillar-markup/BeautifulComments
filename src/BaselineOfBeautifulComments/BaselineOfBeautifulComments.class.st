Class {
	#name : 'BaselineOfBeautifulComments',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBeautifulComments',
	#package : 'BaselineOfBeautifulComments'
}

{ #category : 'baselines' }
BaselineOfBeautifulComments >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
		spec
			baseline: 'Microdown'
			with: [
				spec
					repository: 'github://pillar-markup/Microdown:Pharo12/src';
					loads: #('RichText') ].
		spec 
			package: #'BeautifulComments'  with: [
				spec requires:  #( 'Microdown') ] ]

]
