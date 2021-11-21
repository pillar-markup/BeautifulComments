Class {
	#name : #BCBeautifulCommentsSmokeTest,
	#superclass : #TestCase,
	#category : #'BeautifulComments-Tests'
}

{ #category : #tests }
BCBeautifulCommentsSmokeTest >> testRenderDoesNotRaiseError [

	self 
		shouldnt: [ BeautifulComments  
							renderComment: ClyRichTextClassCommentEditorToolMorph comment 
							of: ClyRichTextClassCommentEditorToolMorph ]
		raise: Error
]
