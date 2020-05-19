"
Please comment meI represent a Blog consisting of Posts
"
Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#category : #TinyBlog
}

{ #category : #helpers }
TBBlog class >> createDemoPosts [
	"TBBlog createDemoPosts"

	self current

		writeBlogPost:
			((TBPost
				title: 'Welcome in TinyBlog'
				text: 'TinyBlog is a small blog engine made with Pharo.'
				category: 'TinyBlog') visible: true);

		writeBlogPost:
			((TBPost
				title: 'Report Pharo Sprint'
				text:
					'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a nice event with more than 15 motivated sprinters. With the help of candies, cakes and chocolate, huge work has been done.'
				category: 'Pharo') visible: true);

		writeBlogPost:
			((TBPost
				title: 'Brick on top of Bloc -Preview'
				text:
					'We are happy to announce the first preview version of Brick, a new widget set created from scratch on top of Bloc. Brick is being developed primarily by Alex Syrel (together with Alain Plantec, Andrei Chis and myself), and the work is sponsored by ESUG. Brick is part of the Glamorous Toolkit effort and will provide the basis for the new versions of the development tools.'
				category: 'Pharo') visible: true);

		writeBlogPost:
			((TBPost
				title: 'Working with Pharo on the Raspberry Pi'
				text:
					'Hardware is getting cheaper and many new small devices like the famous Raspberry Pi provide new computation power that was one once only available on regular desktop computers.'
				category: 'Pharo') visible: true);

		writeBlogPost:
			((TBPost
				title: 'The sad story of unclassified blog posts'
				text: 'So sad that I can read this.'
                                ) visible: true)


]

{ #category : #accessing }
TBBlog class >> current [
	^ self selectAll 
		ifNotEmpty: [ :x | x anyOne ]
		ifEmpty:    [ self new save ]

]

{ #category : #initialization }
TBBlog class >> initialize [ 
	self reset
]

{ #category : #initialization }
TBBlog class >> initializeLocalhostMongoDB [
	| repository |
	repository := VOMongoRepository 
		host: 'localhost' 
		database: 'pharotinyblog'.
	repository enableSingleton.
]

{ #category : #initialization }
TBBlog class >> initializeVoyageOnMemoryDB [
	VOMemoryRepository new enableSingleton
]

{ #category : #testing }
TBBlog class >> isVoyageRoot [
	"For Voyage persistence: indicates that instances of this class
	are top level documents in noSQL databases."
   ^ true
]

{ #category : #initialization }
TBBlog class >> reset [
	"(local memory) self initializeVoyageOnMemoryDB"
	self initializeLocalhostMongoDB 
]

{ #category : #accessing }
TBBlog >> allBlogPosts [
	^ posts
]

{ #category : #accessing }
TBBlog >> allBlogPostsFromCategory: aCategory [
	^ posts select: [ :post | post category = aCategory ]
]

{ #category : #accessing }
TBBlog >> allCategories [
    "select all unique categories"
    | cats |
    cats := self allBlogPosts collect: [ :post | post category ].
    ^ cats asSet 

]

{ #category : #accessing }
TBBlog >> allCategoriesWithVisiblePosts [
    "select all unique categories that have visible posts"
    | cats |
    cats := self allVisibleBlogPosts collect: [ :post | post category ].
    ^ cats asSet 

]

{ #category : #accessing }
TBBlog >> allVisibleBlogPosts [
	^ posts select: [ :post | post isVisible ]
]

{ #category : #accessing }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ (self allBlogPostsFromCategory: aCategory)
		 select: [ :post | post isVisible ]
]

{ #category : #initialization }
TBBlog >> initialize [
	super initialize.
	posts := OrderedCollection new
]

{ #category : #printing }
TBBlog >> printOn: aStream [
	aStream
		nextPutAll: 'A Blog';
		nextPut: Character cr;
		nextPutAll: '--------------------------';
		nextPut: Character cr.
	self allBlogPosts do: [ :post | post printOn: aStream ]
]

{ #category : #removing }
TBBlog >> removeAllPosts [
	posts := OrderedCollection new.
	self save
]

{ #category : #accessing }
TBBlog >> size [ 
	^ posts size
]

{ #category : #writing }
TBBlog >> writeBlogPost: aPost [
	"Add the blog post to the list of posts. Save to database. "
	self allBlogPosts add: aPost.
	self save

]
