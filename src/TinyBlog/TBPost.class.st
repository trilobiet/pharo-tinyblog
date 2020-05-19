"
I represent a Blog post.
"
Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #TinyBlog
}

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText [
	"Create a Post with aTitle and aText"
	^ self new 
		title: aTitle;
		text: aText;
		yourself

]

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText category: aCategory [
	"Create a Post with aTitle, aText and aCategory"
	^ (self title: aTitle text: aText) "(overloaded)"
		category: aCategory;
		yourself

]

{ #category : #helpers }
TBPost class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : #blinking }
TBPost >> beVisible [
	"Set Post visible"
	self visible: true
]

{ #category : #accessing }
TBPost >> category [
	^ category
]

{ #category : #accessing }
TBPost >> category: aCategory [
	category := aCategory
]

{ #category : #accessing }
TBPost >> date [
	^ date
]

{ #category : #accessing }
TBPost >> date: aDate [
	date := aDate
]

{ #category : #initialization }
TBPost >> initialize [
	
	super initialize.
	self category: self class unclassifiedTag. 
	self date: Date today.
	self notVisible.  
]

{ #category : #testing }
TBPost >> isUnclassified [
	^ self category = self class unclassifiedTag
]

{ #category : #testing }
TBPost >> isVisible [
	^ self visible 
]

{ #category : #blinking }
TBPost >> notVisible [
	"Set a Post unvisible"
	self visible: false
]

{ #category : #printing }
TBPost >> printOn: aStream [
	aStream
		nextPut: Character cr;
		nextPutAll: '**';
		nextPutAll: self title;
		nextPutAll: '**';
		nextPut: Character cr;
		nextPutAll: '=========================';
		nextPut: Character cr;
		nextPutAll: self text;
		nextPut: Character cr;
		nextPutAll: 'category: ';
		nextPutAll: self category;
		nextPut: Character cr
]

{ #category : #accessing }
TBPost >> text [
	^ text
]

{ #category : #accessing }
TBPost >> text: aText [
	text := aText
]

{ #category : #accessing }
TBPost >> title [
	^ title
]

{ #category : #accessing }
TBPost >> title: aTitle [
	title := aTitle
]

{ #category : #accessing }
TBPost >> visible [
	^ visible
]

{ #category : #accessing }
TBPost >> visible: aBoolean [
	visible := aBoolean
]
