"
I am a replacement for the _package comments_ tool.


I need to be refactored somehow as `ClyPackageRichTextCommentEditorToolMorph` and `ClyRichTextClassCommentEditorToolMorph` are basically identical
"
Class {
	#name : #ClyPackageRichTextCommentEditorToolMorph,
	#superclass : #ClyPackageCommentEditorToolMorph,
	#instVars : [
		'isRendering'
	],
	#category : #'BeautifulComments-UI'
}

{ #category : #activation }
ClyPackageRichTextCommentEditorToolMorph class >> browserTabActivation [  
	"Do nothing - part of a hack for overriding the class package tool in Calypso"
]

{ #category : #activation }
ClyPackageRichTextCommentEditorToolMorph class >> browserTabActivation2 [  
	"Do nothing - part of a hack for overriding the class package tool in Calypso"
]

{ #category : #converting }
ClyPackageRichTextCommentEditorToolMorph >> asRenderedText: comment [
	"Assumes we are in view source mode. commment might be an instance of RGComment. 
	asText turns it into a Text, and asString into a string, which is what we expect. 
	If we have a real source code, asText asString is dummy and does not fail."

	^ MicRichTextComposer renderComment: comment asText asString of: self editingPackage
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> buildTextMorph [
	super buildTextMorph.
	self setBackgroundColor: self renderColor.
	self bindKeyCombination: $r command toAction: [ self toggleMode ].
	self disable.
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> changesAccepted [
	| res |
	res := super changesAccepted.
	self switchToRenderMode.
	^res
]

{ #category : #initialization }
ClyPackageRichTextCommentEditorToolMorph >> disable [
	textMorph enabled: false
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> editColor [
	^ self theme backgroundColor 
]

{ #category : #initialization }
ClyPackageRichTextCommentEditorToolMorph >> editingText [
	| text |
	text := super editingText.
	^ isRendering 
		ifTrue: [ self asRenderedText: text ]
		ifFalse: [ text ]
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
	isRendering := true.

]

{ #category : #testing }
ClyPackageRichTextCommentEditorToolMorph >> isRendering [
	^ isRendering
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> renderColor [

	| bgColor |
	bgColor := self theme backgroundColor.
	^ bgColor lightness < 0.5
		ifTrue: [ bgColor + (Color r: 0.0 g: 0.04 b:0.08 )]
		ifFalse: [ bgColor darker ]

]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> setBackgroundColor: aColor [

	textMorph color: aColor
	
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> switchToEditMode [
	isRendering := false.
	self enable.
	self setBackgroundColor: self editColor.
	self triggerUpdate
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> switchToRenderMode [
	self hasUnacceptedEdits
		ifTrue: [ ^ self ].
	isRendering := true.
	self setBackgroundColor: self renderColor.
	self disable.
	self triggerUpdate
]

{ #category : #rendering }
ClyPackageRichTextCommentEditorToolMorph >> toggleMode [
	isRendering
		ifTrue: [ self switchToEditMode ]
		ifFalse: [ self switchToRenderMode ]
]
