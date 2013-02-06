(($, window) ->
	window.imports = (()->
		_loadedScripts = {}

		return (name, options) ->
			defaults =
				version: ""
				baseUrl: "js/"	# TODO: Create global configuration
				callback: undefined

			if typeof options is "function"
				options =
					callback: options

			options = $.extend(defaults, options)

			# Prevent from loading the same script twice
			if _loadedScripts[name]
				# Trigger the callback anuways
				if options.callback
					options.callback()
				return

			_loadedScripts[name] = true
			$.holdReady(true)	# Prevent the document ready event from triggering

			$.ajax
				url: "#{options.baseUrl}#{name}.js"
				dataType: "script"
				success: ->
					$.holdReady(false)
					if options.callback
						options.callback()
				error: ->
					console.error("Problem loading script.")	# TODO: This needs improvements
	)()

	# TODO: Handle page state changes with History API

	# Get the actions from the URL hash
	params = location.hash.split("/")

	# It has to be a hash change
	if params.shift() isnt "#!"
		return

	# First one is the action then the method, the rest are the arguments
	action = params.shift() || "Home"
	method = params.shift() || "index"

	# Executes the current page's main script
	window.imports action

	# Executes content until document and imports are ready
	$(document).ready ->
		# Classes are function type
		if typeof window[action] is "function"
			obj = new window[action]	# Caps does matter, should find another way
			if typeof obj[method] is "function"
				obj[method].apply(window, params)
		else
			console.error("Probably caps happened.")

)(jQuery, window)