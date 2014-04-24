console.log("server")

addItems = ->
	console.log("addItems")
	Items.remove({})
	i = 0
	while i < 20
		Items.insert name: "item #{i}"
		i++

Meteor.startup ->
	console.log('server startup')
	addItems()
