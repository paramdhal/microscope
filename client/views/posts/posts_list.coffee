Template.bestPosts.helpers
	options: ->
		sort: 
			votes: -1 
			submitted: -1
		handle: bestPostsHandle

Template.newPosts.helpers
	options: ->
		sort: submitted: -1
		handle: newPostsHandle		

Template.postsList.helpers
	posts: ->
    	Posts.find {},
    		sort: @sort
    		limit: @handle.limit()

    postsReady: ->
    	@handle.ready()

    allPostsLoaded: ->
    	@handle.ready() and Posts.find().count() < @handle.loaded()

    postsWithRank: ->
    	i = 0
    	options = 
    		sort: @sort
    		limit: @handle.limit()

    	Posts.find({}, options).map (post) ->
    		post._rank = i
    		i++
    		post	


Template.postsList.events
	'click .load-more': (e) ->
		e.preventDefault()
		@handle.loadNextPage()
	'click .post': ->
		console.log @._rank	
