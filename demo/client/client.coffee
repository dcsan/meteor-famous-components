
console.log('configure router')
navbar = null
Template.header.rendered = ->
	navbar = @$(".navbar-nav")
	navbarActive Router.current().path
	return

navbarActive = (path) ->
	return  unless navbar
	path = @path  if @path
	navbar.find("li.active").removeClass "active"
	navbar.find("a[href=\"" + path + "\"]").parent().addClass "active"
	return

Router.configure
	onAfterAction: navbarActive
	layoutTemplate: "layout"
	yieldTemplates:
		header:
			to: "header"

Router.map ->
	@route "home",
		path: "/"

	@route "scrollview"
	@route "eventsDemo",
		path: "/events"

	@route "columns"
	return

Template.scrollview.items = Template.list.items = ->
	
	#return [{_id:1, name:'A'}, {_id:2, name:'B'}, {_id:1, name:'C'}, {_id:2, name:'D'}];
	Items.find()

Template.ifBlock.surfaceOne = ->
	Session.get "surfaceOne"

springTransition =
	method: "spring"
	period: 100
	dampingRatio: .1
	velocity: 0.005

Template.blockSpring.events mouseover: (event, tpl) ->
	famousComp = famousCmp.dataFromTpl(tpl)
	famousComp.modifier.setTransform Transform.translate(Math.random() * (window.innerWidth / 2), Math.random() * (window.innerHeight / 2)), springTransition
	return

Transform = undefined
Transitionable = undefined
SpringTransition = undefined
Meteor.startup ->
	Transform = require("famous/core/Transform")
	Transitionable = require("famous/transitions/Transitionable")
	SpringTransition = require("famous/transitions/SpringTransition")
	Transitionable.registerMethod "spring", SpringTransition
	return
