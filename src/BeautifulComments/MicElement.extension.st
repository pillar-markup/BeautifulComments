Extension { #name : 'MicElement' }

{ #category : '*BeautifulComments' }
MicElement class >> buildMicroDownUsing: aBuilder  withComment: aComment [
	 | visitSelector visitors |
	super buildMicroDownUsing: aBuilder  withComment: aComment.
	visitSelector := ('visit', 
		((self name withoutSuffix: 'Block') 
			copyWithoutFirst trimLeft: [ :char |  char isLowercase ] ), 
			':' ) asSymbol.
	visitors := MicrodownVisitor allSubclasses  
		select: [ :class |  class includesSelector: visitSelector ].
	aBuilder newLine.
	aBuilder header: [ aBuilder text:'Visitors using me:' ] withLevel: 2.
	visitors 
		ifEmpty: [ 
			aBuilder text: 'I found no one implementing a ', 
				visitSelector, 
				' - perhaps I am abstract or the visitor is unconventionally named' ] 
		ifNotEmpty: [ 
			aBuilder unorderedListDuring: [
				visitors  do:  [:class |  aBuilder  item:  [ aBuilder monospace: (class name, '>>#', visitSelector ) ]]]]
]
