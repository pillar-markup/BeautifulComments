Extension { #name : #ClyPackageCommentEditorToolMorph }

{ #category : #'*BeautifulComments-Calypso' }
ClyPackageCommentEditorToolMorph class >> new [
	"A hack to swap in the RichText versions of the tools. "
	^ ClyPackageRichTextCommentEditorToolMorph  basicNew initialize
]
