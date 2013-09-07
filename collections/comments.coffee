@Comments = new Meteor.Collection 'comments'

Meteor.methods
	comment: (commentAttributes) ->
		user = Meteor.user()
		post = Posts.findOne commentAttributes.postId


		throw new Meteor.Error(401, "You need to login to make comments") unless user

		throw new Meteor.Error(422, "Please fill in a headline") unless commentAttributes.body

		throw new Meteor.Error(422, "You must comment on a post") unless commentAttributes.postId


		comment = _.extend(_.pick(commentAttributes,"body","postId"),
			userId: user._id
			author: user.username
			submitted: new Date().getTime()
		)

		Posts.update comment.postId, $inc: commentsCount: 1

		Comments.insert comment	

