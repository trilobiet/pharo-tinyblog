"
I define a Test for a TBPost
"
Class {
	#name : #TBPostTest,
	#superclass : #TestCase,
	#category : #'TinyBlog-Tests'
}

{ #category : #tests }
TBPostTest >> testPostIsCreatedCorrectly [
	| post |
	post := TBPost title: 'Whatever' text: 'You name it'.
	self assert: post title equals: 'Whatever'.
	self assert: post text equals: 'You name it'.
]

{ #category : #tests }
TBPostTest >> testWithoutCategoryIsUnclassified [
	| post |
	post := TBPost title: 'Whatever' text: 'You name it'.
	self assert: post isUnclassified. 
	self deny: post isVisible 	
]
