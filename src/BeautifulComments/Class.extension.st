Extension { #name : 'Class' }

{ #category : '*BeautifulComments' }
Class >> addDocumentSectionExampleCodeTo: aBuilder [

	| exampleCode |
	exampleCode := self documentExampleCode. 
	exampleCode ifNil: [ ^ self ].
	
	aBuilder newLine.
	aBuilder header: [ :builder | builder text: 'Example code' ] withLevel: 2.
	aBuilder newLine.
	aBuilder codeblock: exampleCode
]

{ #category : '*BeautifulComments' }
Class >> addDocumentSectionTo: aBuilder label: label methods: methods [
	
	methods ifEmpty: [ ^ self ].
	
	aBuilder newLine.
	aBuilder header: [ :builder | builder text: label ] withLevel: 2.
	aBuilder unorderedListDuring: [  
		(methods sorted: #selector ascending) do: [ :each |
			aBuilder item: [
				aBuilder monospace: (each methodClass name, '>>#', each selector) ] ] ]
]

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

{ #category : '*BeautifulComments' }
Class >> documentExampleCode [
	| exampleMethod |
	
	exampleMethod := self class methods 
		detect: [ :each | 
			(each protocol = self documentExamplesProtocol) 
			and: [ self documentExampleCodeSelector match: each selector match ] ]
		ifNone: [ ^ nil ].
			
	^ (exampleMethod sourceCode lines 
		allButFirst 	"Remove method name"
		reject: [ :each | each trimLeft beginsWith: '<' ]) "Remove pragmas"
		asStringWithCr
		trimmed
]

{ #category : '*BeautifulComments' }
Class >> documentExampleCodeSelector [
	
	^ 'example*'
]

{ #category : '*BeautifulComments' }
Class >> documentExamplesProtocol [
	
	^ #'*Examples'
]
