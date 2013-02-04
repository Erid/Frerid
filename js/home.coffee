class Home
	constructor: ->
		$(document).html("<h1>This is home</h1>")

	# Url would be like website.com/#!/Home/multiply/1/2
	multiply: (a, b) ->
		$(document).append("The answer is #{a*b}.")