Class {
	#name : #BCBeautifulCommentsSmokeTest,
	#superclass : #TestCase,
	#category : #'BeautifulComments-Tests'
}

{ #category : #tests }
BCBeautifulCommentsSmokeTest >> testSmokeSignal [
	BeautifulComments captureErrors: true.
	Smalltalk globals allClasses do: [ :cl |
			BeautifulComments  
							renderComment: cl comment 
							of: cl
		
		 ]	
]

{ #category : #tests }
BCBeautifulCommentsSmokeTest >> testSmokeSignalAndChoke [
	| difficultClasses |
	"this test disables error handling and tries to render all class comments in the system"
	"Really, it is a test of the robustness of Microdown parsing and rendering"
	self skip.
	BeautifulComments captureErrors: false.
	difficultClasses := OrderedCollection new.
	Smalltalk globals allClasses do: [ :cl |
			[BeautifulComments renderComment: cl comment of: cl]
			on: Exception 
			do: [ difficultClasses add: cl ]
		 ].
	self assert: difficultClasses isEmpty
]
