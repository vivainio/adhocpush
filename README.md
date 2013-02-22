# Ad hoc push

Typical problem: you have a phone with network connection set up. You don't want to hassle with bluetooth or USB (or,g asp. IR). You just want to browse the device file system, copy over some files, open url's in browser, etc.

Adhocpush works by creating a small p2p network (think of it as "chatroom") by password alone. You install adhocpush app on your phone and specify a password. You specify the same password on web interface to send commands.

First implementation for the phone client will be for Nokia Asha phones. They will connect to the web service by long polling or interval polling. The phone application
will be responsible for understanding the messages coming from the web service, and 
implementing relevant functionality.

Phone application will support "plugins" so that you can easily add new message types.

Suggested format is json like this:

```javascript
{
	'_type' : 'pushfiles',
	'data' : {
		files: []
	}
}
```
Central dispatcher would look at _type and give it to the plugin registered to handle that type. The rest is up to the plugin.

Current state: no code has been written yet.

Suggested tooling: Node & express.js for the web interface, Java for the client end.


What follows is a spec for packages that we can handle.

All commands MUST contain: _type and args.

All command CAN contain: "request_cookie" and client_id.

In case of no client_id, all connected devices (that feel like it) can respond.

### Launch url 

Opens url in the browser

```javascript
{
	'_type': 'launch_url',
	'client': "asha_311_rd",
	'args' : {
		'url' : 'http://google.com'
	}
}
}
```

Reply: none


### List files

```javascript

{
	_type : 'find_files',
	request_cookie: "decafbad",
	args : {
		rootdir : "c:/",

	}
}
```

Reply:

```javascript

{
	_type: 'find_files_reply',
	reply_cookie: "decafbad",
	args : {
		files: [{name: "c:/a.txt"}, ...]
	}
}
```

### Request download

Download urls from internet to file system

```javascript 

{
	_type: 'download_files',
	args: {
		files: {
			url: "http://download.pics.com/lolcat.png",
			targetdir: "c:/lolcat.png"
	}

	}
}
```

### Request upload

Ask phone to upload files to the service

```javascript

{
	_type: "upload_files",
	request_cookie: "decafbad"
	args: {
		files: ["c:/lolcat.png"]

	}
}
```

Reply

```javascript

{
	_type: "upload_files_reply",
	request_cookie: "decafbad",
	args: {


	}

}


}





