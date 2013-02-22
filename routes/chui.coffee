exports.chui = (req, res) ->
	ch = req.params.channel
	room = global.engine.get_room ch
	waiters = room.waiter_ids()
	log = room.log
	res.render 'chui', 
		waiters : waiters 
		channel : req.params.channel
		log: room.log

