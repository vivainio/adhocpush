console.log "ahpengine"

class AhpEngine
	constructor: ->
		@rooms = {}

	get_room: (name) ->
		if name of @rooms
			console.log "Existing room", name
			return @rooms[name]
		@rooms[name] = r = new Room(name)
		console.log "New room",r
		return r

	wait_message: (channel, resp) ->	
		r = @get_room channel
		r.add_response_waiter resp

class Room
	constructor: (@name)->
		
		@client = {}
		@waiters = []

	add_response_waiter: (resp) ->
		@waiters.push resp
		console.log "Add wait on",@name


	post_message: (m) ->
		console.log "Posting",m
		for w in @waiters
			console.log "Sending to waiter"
			w.send(m)
		console.log "Sent to all"
		@waiters = []








exports.AhpEngine = AhpEngine