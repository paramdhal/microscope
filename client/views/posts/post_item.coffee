Template.postItem.helpers
    domain: ->
        a = document.createElement('a')
        a.href = @url
        a.hostname
    
    ownPost: ->
    	@userId is Meteor.userId()

    # commentsCount: ->
    # 	Comments.find(postId:@_id).count()