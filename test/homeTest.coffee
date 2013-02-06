chai = require "chai"
expect = chai.expect
chai.should()

{Home} = require "../src/home"

describe "Home", ->
	home = null
	it "should be a function", ->
		type = typeof Home
		type.should.equal "function"