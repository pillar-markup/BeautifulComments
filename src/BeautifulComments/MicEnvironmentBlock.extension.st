Extension { #name : 'MicEnvironmentBlock' }

{ #category : '*BeautifulComments' }
MicEnvironmentBlock class >> buildMicroDownUsing: aBuilder withComment: aString [
	
	super buildMicroDownUsing: aBuilder withComment: aString.
	self addDocumentDefinedEnvironments: aBuilder
]
