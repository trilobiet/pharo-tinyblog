"
I am the TinyBlog common header.
"
Class {
	#name : #TBHeaderComponent,
	#superclass : #WAComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [  
		html tbsNavbarBrand
			url: self application url;
			with: 'TinyBlog' 
	]

]

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [
	"This header renders itself using Twitter Bootstrap"
	html tbsNavbar beDefault;
	with: [ 
		html tbsContainer: [  
			self renderBrandOn: html
		]	 
	]
]
