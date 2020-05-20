"
I hold a sorted list of category strings and a reference to the component managing the post list.
"
Class {
	#name : #TBCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #creating }
TBCategoriesComponent class >> categories: categories postsList: aTBScreen [
"Create a new TBCategoriesComponent with categories and a postsList"
	
	^ self new
		categories: categories;
		postsList: aTBScreen.  
]

{ #category : #accessing }
TBCategoriesComponent >> categories [ 
	^ categories 
]

{ #category : #accessing }
TBCategoriesComponent >> categories: aCollection [
	categories := aCollection asSortedCollection 
]

{ #category : #accessing }
TBCategoriesComponent >> postsList [
	^ postsList 
]

{ #category : #accessing }
TBCategoriesComponent >> postsList: aComponent [
	postsList := aComponent
]

{ #category : #rendering }
TBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [ 
	html tbsLinkifyListGroupItem
		callback: [ self selectCategory: aCategory ];
		with: aCategory
]

{ #category : #rendering }
TBCategoriesComponent >> renderContentOn: html [
	html tbsListGroup: [  
		html tbsListGroupItem
			darkBackground; "add bg-dark to css class"
			with: [ html strong: 'Categories' ].
		categories do: [ :cat |
			self renderCategoryLinkOn: html with: cat	
		]		
	]
]

{ #category : #actions }
TBCategoriesComponent >> selectCategory: aCategory [ 
	postsList currentCategory: aCategory  
]
