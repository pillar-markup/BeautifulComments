"
I am a replacement for the _package comments_ tool.


"
Class {
	#name : #ClyPackageRichTextCommentEditorToolMorph,
	#superclass : #ClyPackageCommentEditorToolMorph,
	#traits : 'TClyRichTextCommentEditorPaneMorph',
	#classTraits : 'TClyRichTextCommentEditorPaneMorph classTrait',
	#instVars : [
		'isRendering'
	],
	#category : #'BeautifulComments-Core'
}

{ #category : #activation }
ClyPackageRichTextCommentEditorToolMorph class >> browserTabActivation [  
	"Do nothing - part of a hack for overriding the class package tool in Calypso"
]

{ #category : #activation }
ClyPackageRichTextCommentEditorToolMorph class >> browserTabActivation2 [  
	"Do nothing - part of a hack for overriding the class package tool in Calypso"
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> asRenderedText [

	^ MicRichTextComposer new 
			renderComment: super editingText asText asString 
			of: self editingPackage
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> asRenderedText: comment [
	"Assumes we are in view source mode. commment might be an instance of RGComment. 
	asText turns it into a Text, and asString into a string, which is what we expect. 
	If we have a real source code, asText asString is dummy and does not fail."

	^ self renderComment: comment asText asString of: self editingPackage 
]

{ #category : #initialization }
ClyPackageRichTextCommentEditorToolMorph >> disable [
	textMorph enabled: false
]

{ #category : #initialization }
ClyPackageRichTextCommentEditorToolMorph >> enable [
	textMorph enabled: true
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> fillStatusBar [

	super fillStatusBar.
	statusBar addCommandItem: (ClyEditCommentSwitchMorph for: self).
	statusBar addCommandItem: (ClySyntaxHelpMorph for: self).

]

{ #category : #initialization }
ClyPackageRichTextCommentEditorToolMorph >> initialize [
	super initialize.
	self initializePaneTrait.

]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> setBackgroundColor: aColor [

	textMorph color: aColor
	
]
