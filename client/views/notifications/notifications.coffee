Template.notifications.helpers
	notifications: ->
		Notifications.find 
			userId: Meteor.userId()
			read: false

	notificationCount: ->
		Notifications.find(
			userId: Meteor.userId()
			read: false
		).count()

Template.notification.events
	'click a': (e) ->
		Notifications.remove _id: @_id 
