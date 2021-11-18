"
I hold preferences for the BeautifulComments (in class variables and methods on my class side).

## Settings
- In particular one can disable rich text rendering (showing the raw comments of the class), which is done in the settings browser `rendering`, or through my class side method `render: aBoolean`.

- As per fall of 2021 microdown and microdown support in Pharo is still in active development. Errors can occour! It is possible to set the comment to be robust to errors in the microdown in class comments. This is controlled by the `capture errors`, or through the class side method: 'captureErrors: aBoolean`.
"
Class {
	#name : #BeautifulComments,
	#superclass : #Object,
	#classVars : [
		'CaptureErrors',
		'Rendering'
	],
	#category : #'BeautifulComments-Core'
}

{ #category : #settings }
BeautifulComments class >> captureErrors [ 
	^ CaptureErrors ifNil: [ false ]
]

{ #category : #settings }
BeautifulComments class >> captureErrors: aBoolean [ 
	CaptureErrors := aBoolean
]

{ #category : #settings }
BeautifulComments class >> preferencesSettingsOn: aBuilder [
	<to_be_done_systemsettings>
	(aBuilder group: #comments)
		label: 'Comment rendering';  
		parent: #appearance;
		description: 'All settings concerned with the control of nice comment rendering';
		with: [. 
			(aBuilder setting: #notRendering)
				label: 'To disable richtext rendering';
				default: false;
				target: self;
				description: 'Comments are by default rendered via Pillar in Richtext. When this setting is on, they are rendered as plain text (showing their Microdown definitions).'. 
			(aBuilder setting: #captureErrors)
				label: 'To disable rendering error capture';
				default: true;
				target: self;
				description: 'By default if there is an error during the rendering of the comments, various errors are trapped. If you want to get such errors to debug the system, you should turn off this settings.'. 
			
			]
]

{ #category : #rendering }
BeautifulComments class >> render: aString [ 
	"Render a string, in case of error, just return it."
	
	self rendering 	
		ifFalse: [ ^ aString ].
	self captureErrors 
		ifFalse: [ ^ MicRichTextComposer microdownAsRichText: aString ].
	^ [ MicRichTextComposer microdownAsRichText: aString ] 
			on: Error
			do: [ aString  ]
]

{ #category : #rendering }
BeautifulComments class >> renderComment: aString of: aClassOrPackage [ 
	"Return aString as part of the templated class comment, when rendering is on.
	Else aString."
	
	| builder |
	builder := MicroDownParser builder.
	aClassOrPackage buildMicroDownUsing: builder withComment: aString.
	^ self render: builder contents
]

{ #category : #settings }
BeautifulComments class >> rendering [
	^ Rendering ifNil: [ true ]
]
