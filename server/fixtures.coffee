now = new Date().getTime()

hoursAgo = (hours) ->
    now - hours * 3600 * 100

if Posts.find().count() is 0

    tomId = Meteor.users.insert
        profile:
            name: "Tom Coleman"

    tom = Meteor.users.findOne tomId

    sachaId = Meteor.users.insert
        profile:
            name: "Sacha Greif"

    sacha = Meteor.users.findOne sachaId

    telescopeId = Posts.insert
        title: 'Introducing Telescope'
        userId: sacha._id
        author: sacha.profile.name
        url: 'http://sachagreif.com/introducing-telescope/' 
        submitted: hoursAgo 7
        commentsCount: 2

    Comments.insert
        postId: telescopeId
        userId: tom._id
        author: tom.profile.name
        submitted: hoursAgo 5 
        body: "Interesting project Sacha, can I get involved?"

    Comments.insert
        postId: telescopeId
        userId: sacha._id
        author: sacha.profile.name
        submitted: hoursAgo 3
        body: "Interesting project Sacha, can I get involved?"                

    Posts.insert
        title: 'Meteor'
        userId: tom._id
        author: tom.profile.name
        url: 'http://meteor.com'
        submitted: hoursAgo 10
        commentsCount: 0

    Posts.insert
        title: 'The Meteor Book'
        userId: tom._id
        author: tom.profile.name
        url: 'http://themeteorbook.com'  
        submitted: hoursAgo 13
        commentsCount: 0

