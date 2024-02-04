Extension { #name : 'MicRichTextCodeBlockStyler' }

{ #category : '*BeautifulComments' }
MicRichTextCodeBlockStyler class >> buildMicroDownUsing: aBuilder  withComment: aComment [
	super buildMicroDownUsing: aBuilder  withComment: aComment.
	"Only add this list here, not in my subclasses"
	self = MicRichTextCodeBlockStyler ifFalse: [ ^ self ].
	aBuilder newLine.
	aBuilder header: [ aBuilder text: 'Subclasses implementing stylers:' ] withLevel: 2.
	aBuilder unorderedListDuring: [ 
		self allSubclasses do: [ :class |
			aBuilder item: [ 
				aBuilder text: (class styleTags joinUsing: ', ' last: ' and '), ' is implemented by ' .
				aBuilder monospace: (class name)]
			]]
]
