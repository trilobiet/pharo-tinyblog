"
I am the abstract superclass for all web app pages in TinyBlog.
"
Class {
	#name : #TBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #accessing }
TBScreenComponent >> blog [
	"Get the current blog."
	^ TBBlog current
]

{ #category : #hooks }
TBScreenComponent >> children [
	^ { header }
]

{ #category : #rendering }
TBScreenComponent >> createHeaderComponent [
	^ TBHeaderComponent new
]

{ #category : #initialization }
TBScreenComponent >> initialize [
	"Initialize the screen component."
	super initialize.
	header := self createHeaderComponent
]

{ #category : #rendering }
TBScreenComponent >> renderContentOn: html [
	"header is a TBHeaderComponent"
	html render: header
]
