"
I am a replacement tool for **class** comments. 

I need to be refactored somehow as `ClyPackageRichTextCommentEditorToolMorph` and `ClyRichTextClassCommentEditorToolMorph` are basically identical
"
Class {
	#name : #ClyRichTextClassCommentEditorToolMorph,
	#superclass : #ClyClassCommentEditorToolMorph,
	#traits : 'TClyRichTextCommentEditorPaneMorph',
	#classTraits : 'TClyRichTextCommentEditorPaneMorph classTrait',
	#instVars : [
		'isRendering'
	],
	#category : #'BeautifulComments-UI'
}

{ #category : #activation }
ClyRichTextClassCommentEditorToolMorph class >> classCommentTabActivation [ 
	"Do nothing - part of a hack for overriding the class comment tool in Calypso"
]

{ #category : #activation }
ClyRichTextClassCommentEditorToolMorph class >> classTabActivation [  
	"Do nothing - part of a hack for overriding the class comment tool in Calypso"
]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> asRenderedText: comment [
	"Assumes we are in view source mode. commment might be an instance of RGComment. 
	asText turns it into a Text, and asString into a string, which is what we expect. 
	If we have a real source code, asText asString is dummy and does not fail."

	^ self renderComment: comment asText asString of: self editingClass 
]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> disable [
	textMorph enabled: false
]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> enable [
	textMorph enabled: true
]

{ #category : #rendering }
ClyRichTextClassCommentEditorToolMorph >> fillStatusBar [

	super fillStatusBar.
	statusBar addCommandItem: (ClyEditCommentSwitchMorph for: self).
	statusBar addCommandItem: (ClySyntaxHelpMorph for: self).

]

{ #category : #initialization }
ClyRichTextClassCommentEditorToolMorph >> initialize [

	super initialize.
	self initializePaneTrait
]

{ #category : #initialization }
ClyRichTextClassCommentEditorToolMorph >> setBackgroundColor: aColor [
	
	textMorph color: aColor
	
]
