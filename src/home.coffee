class Home
	constructor: ->
		$("#main").html("<h1>This is home</h1>")

	index: ->
		$("#main").append("<p>This is the Index behavior of this action.</p>")

	# Url would be like website.com/#!/Home/multiply/1/2
	multiply: (a, b) ->
		$("#main").append("<p>The answer is #{a*b}.</p>")