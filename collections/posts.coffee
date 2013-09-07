@Posts = new Meteor.Collection 'posts'

Posts.allow
	update: ownsDocument
	remove: ownsDocument

Posts.deny
	update: (userId,post,fieldNames) ->
		_.without(fieldNames, 'url','title').length > 0	

Meteor.methods
	post: (postAttributes) ->
		user = Meteor.user()
		postWithSameLink = Posts.findOne
			url: postAttributes.url

		throw new Meteor.Error(401, "You need to login to post new stories") unless user

		throw new Meteor.Error(422, "Please fill in a headline") unless postAttributes.title

		throw new Meteor.Error(302, "This link has already been posted",postWithSameLink._id) if postAttributes.url and postWithSameLink

		post = _.extend(_.pick(postAttributes,"url","title","message"),
			userId: user._id
			author: user.username
			submitted: new Date().getTime()
			commentsCount: 0
		)

		Posts.insert post	

