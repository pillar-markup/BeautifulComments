Extension { #name : 'MicAnnotationBlock' }

{ #category : '*BeautifulComments' }
MicAnnotationBlock class >> buildMicroDownUsing: aBuilder withComment: aString [
	
	super buildMicroDownUsing: aBuilder withComment: aString.
	self addDocumentDefinedAnnotations: aBuilder
]
