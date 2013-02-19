
exports.messages = (req, res) ->
    ch = req.params.channel
    clientid = req.query.clientid
    #messages = global.engine.messages ch    
    global.engine.wait_message ch, res, clientid
    console.log "Wait",ch, "client",clientid

exports.postmessage = (req, res) ->
	
	console.log "Posting!"
	console.log req
	body = req.body
	console.log "body", body
	r = global.engine.get_room(req.params.channel)

	r.post_message body
	res.send "{ 'status' : 'ok' }"
