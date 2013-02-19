exports.chui = (req, res) ->
	ch = req.params.channel
	room = global.engine.get_room ch
	waiters = room.waiter_ids()
	res.render('chui', { waiters : waiters, channel : req.params.channel });
