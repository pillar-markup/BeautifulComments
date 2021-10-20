"
I implement the `Syntax help` button in the lower right of this pane:

![image](https://user-images.githubusercontent.com/17723745/138031552-9f8c5653-1b9c-4553-8aa4-0fe0ff75faf8.png).


"
Class {
	#name : #ClySyntaxHelpMorph,
	#superclass : #ClyStatusBarItemMorph,
	#instVars : [
		'button'
	],
	#category : #'BeautifulComments-Morph'
}

{ #category : #building }
ClySyntaxHelpMorph >> action [

	| window text | 
	window := SystemWindow labelled: 'Microdown Syntax Summary'.
	window extent: 400@300.
	text := self buildText.
	text setText: self syntax.
	window addMorph: text frame: (0 @ 0 corner: 1 @ 1).
	window openInWorld
]

{ #category : #building }
ClySyntaxHelpMorph >> build [
	
	button := PluggableButtonMorph
		on: self 
		getState: nil
		action:  #action 
		label: #label 
		menu: nil. 	
	self addMorph: button
]

{ #category : #building }
ClySyntaxHelpMorph >> buildText [ 
 
	| textModel scrolledText |
	textModel := RubScrolledTextModel new interactionModel: self.
	scrolledText := textModel newScrolledText
		beReadOnly;
		beWrapped;
		yourself.
	scrolledText textArea font: StandardFonts codeFont.
	^ scrolledText
]

{ #category : #accessing }
ClySyntaxHelpMorph >> label [
	^ 'Syntax Help'
]

{ #category : #building }
ClySyntaxHelpMorph >> rawMicrodownSyntax [

	^ '
# Microdown is quite cool

It allow us to write formatted text using a github inspired markdown.

Take a look at the [project home page](https://github.com/pillar-markup/Microdown) to see how to use it. 

'
]

{ #category : #building }
ClySyntaxHelpMorph >> syntax [ 
	"Return a text to be rendered by a morph, and produced by the MicRichTextComposer"
	
	^ (MicRichTextComposer render: self rawMicrodownSyntax )
]
