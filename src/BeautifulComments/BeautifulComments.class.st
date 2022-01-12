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
BeautifulComments class >> beautifulCommentsSettingsOn: aBuilder [
	"These settings are added to the settings defined in Microdown>>preferencesSettingsOn:"
	<systemsettings>
	(aBuilder setting: #rendering)
		parent: #microdownAndcomments;
		label: 'Enable richtext comments';
		default: true;
		target: self;
		description: self renderingDocForSetting.
	(aBuilder setting: #captureErrors)
		parent: #microdownAndcomments;
		label: 'Enable rendering error capture';
		default: true;
		target: self;
		description: self captureErrorsDocForSetting
]

{ #category : #settings }
BeautifulComments class >> captureErrors [ 
	^ CaptureErrors ifNil: [ false ]
]

{ #category : #settings }
BeautifulComments class >> captureErrors: aBoolean [ 
	CaptureErrors := aBoolean
]

{ #category : #rendering }
BeautifulComments class >> render: aString [ 
	"Render a string, in case of error, just return it."
	
	self rendering 	
		ifFalse: [ ^ aString ].
	self captureErrors 
		ifFalse: [ ^ Microdown asRichText: aString ].
	^ [ Microdown asRichText: aString ] 
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

{ #category : #rendering }
BeautifulComments class >> rendering: aBoolean [
	Rendering := aBoolean
]
