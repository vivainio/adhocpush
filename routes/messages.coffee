
exports.messages = (req, res) ->
    ch = req.params.channel    
    #messages = global.engine.messages ch    
    global.engine.wait_message ch, res
    console.log "Wait",ch

exports.postmessage = (req, res) ->
	
	console.log "Posting!"
	console.log req
	body = req.body
	console.log "body", body
	r = global.engine.get_room(req.params.channel)

	r.post_message body
	res.send "{ 'status' : 'ok' }"
