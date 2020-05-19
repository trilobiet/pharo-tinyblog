"
I represent a list of Blog Posts in a Seaside application
"
Class {
	#name : #TBPostsListComponent,
	#superclass : #TBScreenComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBPostsListComponent >> renderContentOn: html [ 
	super renderContentOn: html.
	self blog allVisibleBlogPosts do: [ :post |
		html render: (TBPostComponent new post: post)	
	]
]
