(($, window) ->
	_loadedModules = new Array()

	###
	@exports _import as import
	###
	_import = (name, options) ->
		defaults =
			version: ""
			baseUrl: undefined
			callback: undefined

		if typeof options is "function"
			options =
				callback: options

		options = $.extend(defaults, options)

		if @exists(name)
			return

		_loadedModules.push(name)
		$.holdReady(true)

		$.getScript "#{baseUrl}#{name}#{version}.js", ->
			$.holdReady(false)
			if options.callback
				options.callback()

	# Get view
	view = "home"
	params =
		a: 1
		b: 2

	# Executes the current page's main script
	_import view, ->


	window.import = _import
)(jQuery, window)