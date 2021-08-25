Class {
	#name : #BCBeautifulCommentsSmokeTest,
	#superclass : #TestCase,
	#category : #'BeautifulComments-Tests'
}

{ #category : #tests }
BCBeautifulCommentsSmokeTest >> testRenderDoesNotRaiseError [

	self 
		shouldnt: [ MicRichTextComposer 
							renderComment: ClyRichTextClassCommentEditorToolMorph comment 
							of: ClyRichTextClassCommentEditorToolMorph ]
		raise: Error
]
