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

	wait_message: (channel, resp, clientid) ->	
		r = @get_room channel
		r.add_response_waiter resp, clientid

class Room
	constructor: (@name)->
		
		@client = {}
		@waiters = []
		@log = []

	add_response_waiter: (resp, clientid = "") ->
		@waiters.push [resp, clientid]
		console.log "Add wait on",@name

	waiter_ids: ->
		console.log "Get waiters", @waiters.length
		return (w[1] for w in @waiters)

	post_message: (m) ->
		console.log "Posting",m

		@log.unshift JSON.stringify(m)
		for w in @waiters
			[resp, clientid] = w
			console.log "Sending to waiter " + clientid
			@log.unshift "Sent to: "+clientid
			resp.send(m)
		console.log "Sent to all"
		@waiters = []

exports.AhpEngine = AhpEngine