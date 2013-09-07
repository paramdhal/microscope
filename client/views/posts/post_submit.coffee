Template.postSubmit.events
    'submit form': (e) ->
        e.preventDefault()

        post =
            url: $(e.target).find('[name="url"]').val(),
            title: $(e.target).find('[name="title"]').val(),
            message: $(e.target).find('[name="message"]').val()

        Meteor.call 'post', post, (error,id) ->
        	if error
        		throwError error.reason
        		Meteor.Router.to 'postPage', error.details if error.error is 302 
        	else	
        		Meteor.Router.to 'postPage', id