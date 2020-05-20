"
I define a Test for a TBBlog
"
Class {
	#name : #TBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first',
		'previousRepository'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #running }
TBBlogTest >> setUp [
	"Setup for tests. Save repository to be restored after testing."
	previousRepository := VORepository current.
	VORepository setRepository: VOMemoryRepository new.
	blog := TBBlog current.

	"A first post is added to the blog."
	first := TBPost title: 'A Title' text: 'A Text' category: 'First Category'.
	blog writeBlogPost: first.

	"A second post is created but not yet added."
	post := (TBPost title: 'Another Title' text: 'Another Text' 
		category: '2nd Category')  beVisible. 	

]

{ #category : #running }
TBBlogTest >> tearDown [ 
	"Restore repository after testing completes."
	VORepository setRepository: previousRepository 
]

{ #category : #running }
TBBlogTest >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2

]

{ #category : #tests }
TBBlogTest >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allBlogPosts size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllBlogPostsFromCategory [ 
	self assert: (blog allBlogPostsFromCategory: 'First Category')
		size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllCategories [
	blog writeBlogPost: post.
	self assert: blog allCategories size equals: 2
]

{ #category : #tests }
TBBlogTest >> testAllCategoriesWithVisiblePosts [
	blog writeBlogPost: post.
	self assert: blog allCategoriesWithVisiblePosts size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllVisibleBlogPosts [	
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllVisibleBlogPostsFromCategory [
	blog writeBlogPost: post.
	self assert: (blog allVisibleBlogPostsFromCategory: 'First Category')
		size equals: 0.
	self assert: (blog allVisibleBlogPostsFromCategory: '2nd Category')
		size equals: 1.		
]

{ #category : #tests }
TBBlogTest >> testRemoveAllBlogPosts [
	blog removeAllPosts.
	self assert: blog size equals: 0
]

{ #category : #tests }
TBBlogTest >> testSize [ 
	self assert: blog size equals: 1
]

{ #category : #tests }
TBBlogTest >> testUnclassifiedBlogPosts [
    self assert: (blog allBlogPosts select: [ :p | p isUnclassified ])
        size equals: 0
]
