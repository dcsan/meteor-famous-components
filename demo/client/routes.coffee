@navbar = null

@navbarActive = (path) ->
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

	@route "gridMenu",
		path: "/gridMenu"
	@route "grid1",
		path: "/grid1"
	@route "grid2",
		path: "/grid2"

	@route "columns"
	return
