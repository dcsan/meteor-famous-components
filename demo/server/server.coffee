addItems = ->
	console.log("addItems")
	if Items.find().count() is 0
		i = 0
		while i < 20
			@Items.insert name: Random.id()
			i++

Meteor.startup = ->
	console.log('server startup')
	addItems()
