console.log "ahpengine"

class AhpEngine
	constructor: ->
		@rooms = {}

	get_room: (name) ->
		if name in rooms
			return rooms[name]
		rooms[name] = r = new Room(name)
		return r

	messages: (channel) ->
		r = get_room channel
		r.messages()





class Room
	constructor: (@name)->
		
		@client = {}

	messages: ->
		return "Hello"


exports.AhpEngine = AhpEngine