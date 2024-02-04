Extension { #name : 'Class' }

{ #category : '*BeautifulComments' }
Class >> buildMicroDownUsing: aBuilder withComment: aString [
	
	aBuilder 
		header: [ aBuilder text: 'Class: '.
					aBuilder text: self name ] withLevel: 1;
		horizontalLine;
		text: aString.
	
	self addDocumentSectionExampleCodeTo: aBuilder.
	
	self 
		addDocumentSectionTo: aBuilder  
		label: 'Examples' 
		methods: (self class methods select: [ :each | each protocol = self documentExamplesProtocol ])
]
