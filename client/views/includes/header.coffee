Template.header.helpers
	activeRouteClass: (routes...)->
		routes.pop()

		active = _.any routes,(name)->
			location.pathname is Meteor.Router[name + 'Path']()

		active and 'active'	
