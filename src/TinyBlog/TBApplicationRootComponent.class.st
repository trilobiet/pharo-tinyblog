"
I represent the webapplication root component.
"
Class {
	#name : #TBApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #testing }
TBApplicationRootComponent class >> canBeRoot [
	"Answer that I am not just a Seaside component, but a complete application."
	^ true
]

{ #category : #'class initialization' }
TBApplicationRootComponent class >> initialize [ 
	"Self initialize."
	| app |
	"Path to web app."
	app := WAAdmin register: self asApplicationAt: 'tinyblog'.
	"Load jQuery and Bootstrap libraries."
	app 
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary  
	
]

{ #category : #hooks }
TBApplicationRootComponent >> children [
	"List all child components of this root component"
	^ { main }
]

{ #category : #initialization }
TBApplicationRootComponent >> initialize [
	super initialize.
	"default main component"
	main := TBPostsListComponent new 
]

{ #category : #initialization }
TBApplicationRootComponent >> main: aComponent [
	"set main component"
	main := aComponent
]

{ #category : #rendering }
TBApplicationRootComponent >> renderContentOn: html [
	"Root content renderer renders on main (a TBScreenComponent)"
	html render: main 
]
