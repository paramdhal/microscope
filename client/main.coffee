@newPostsHandle = Meteor.subscribeWithPagination 'newPosts', 10
@bestPostsHandle = Meteor.subscribeWithPagination 'bestPosts', 10


Deps.autorun ->
	Meteor.subscribe 'comments', Session.get 'currentPostId'
	Meteor.subscribe 'singlePost', Session.get 'currentPostId'

Meteor.subscribe 'notifications'