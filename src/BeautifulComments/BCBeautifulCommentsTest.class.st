"
I am a test class for BeautifulComments.
For testing purposes I include the pharo logo:

![](https://pharo.org/web/files/pharo.png)
"
Class {
	#name : #BCBeautifulCommentsTest,
	#superclass : #TestCase,
	#category : #'BeautifulComments-Tests'
}

{ #category : #tests }
BCBeautifulCommentsTest >> testOfflineModeInCache [
	| aText image|
	"Put image in cache"
	BeautifulComments offline: false.
	aText := BeautifulComments  
							renderComment: self class comment 
							of: self class.
	image := (aText attributesAt: (aText asString findString: (String value: 1))) first anchoredMorph .
	self assert: image height equals: 155.
	
	"Switch to offline mode"
	BeautifulComments offline: true.
	aText := BeautifulComments  
							renderComment: self class comment 
							of: self class.
	image := (aText attributesAt: (aText asString findString: (String value: 1))) first anchoredMorph .
	self assert: image height equals: 155.
]

{ #category : #tests }
BCBeautifulCommentsTest >> testOfflineModeNotInCache [
	| aText image|
	"Reset cache"
	MicHTTPResource initialize.
	BeautifulComments offline: true.
	aText := BeautifulComments  
							renderComment: self class comment 
							of: self class.
	"Make sure we did not get the pharo logo."
	image := (aText attributesAt: (aText asString findString: (String value: 1))) first anchoredMorph .
	self deny: image height equals: 155.
]

{ #category : #tests }
BCBeautifulCommentsTest >> testOnlineMode [
	| aText image|
	BeautifulComments offline: false.
	aText := BeautifulComments  
							renderComment: self class comment 
							of: self class.
	image := (aText attributesAt: (aText asString findString: (String value: 1))) first anchoredMorph . 
	self assert: image height equals: 155
	
]

{ #category : #tests }
BCBeautifulCommentsTest >> testRenderDoesNotRaiseError [
	"Just make sure this do not fail by running it"
	BeautifulComments
		renderComment: ClyRichTextClassCommentEditorToolMorph comment
		of: ClyRichTextClassCommentEditorToolMorph
]
