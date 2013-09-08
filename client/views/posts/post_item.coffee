Template.postItem.helpers
    domain: ->
        a = document.createElement('a')
        a.href = @url
        a.hostname
    
    ownPost: ->
    	@userId is Meteor.userId()

    upvotedClass: ->
    	userId = Meteor.userId()
    	if userId and not _.include(@upvoters,userId)
    		"btn-primary upvotable"
    	else
    		"disabled"		

Template.postItem.events
	'click .upvotable': (e)->
		e.preventDefault()
		Meteor.call 'upvote', @_id

Template.postItem.rendered = ->
	
	rank = @data._rank		
	$this = $(@firstNode)
	postHeight = 75
	newPosition = rank * postHeight

	if @currentPosition?

		previousPosition = @currentPosition
		delta = previousPosition - newPosition
		$this.css 'top': delta+ "px"
	else
		$this.addClass 'invisible'	

	Meteor.defer =>
		@currentPosition = newPosition
		$this.css('top': 0).removeClass 'invisible'	
