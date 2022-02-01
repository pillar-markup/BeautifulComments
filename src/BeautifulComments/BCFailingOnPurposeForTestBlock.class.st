"
I am a comment which cannot be rendered correctly - I use a dedicated error to fail. ?{failingOnPurpose}?
"
Class {
	#name : #BCFailingOnPurposeForTestBlock,
	#superclass : #MicAnnotationBlock,
	#category : #'BeautifulComments-Tests'
}

{ #category : #accessing }
BCFailingOnPurposeForTestBlock class >> tag [
	^ #failingOnPurpose
]

{ #category : #visiting }
BCFailingOnPurposeForTestBlock >> accept: aVisitor [
	BCFailingOnPurposeForTestError signal
]
