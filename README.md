# Ad hoc push

Typical problem: you have a phone with network connection set up. You don't want to hassle with bluetooth or USB (or,g asp. IR). You just want to browse the device file system, copy over some files, open url's in browser, etc.

Adhocpush works by creating a small p2p network (think of it as "chatroom") by password alone. You install adhocpush app on your phone and specify a password. You specify the same password on web interface to send commands.

First implementation for the phone client will be for Nokia Asha phones. They will connect to the web service by long polling or interval polling. The phone application
will be responsible for understanding the messages coming from the web service, and 
implementing relevant functionality.

Phone application will support "plugins" so that you can easily add new message types.

Suggested format is json like this:

```json
{
	'_type' : 'pushfiles'
	'data' : {
		files: [...]
	}
}
```
Central dispatcher would look at _type and give it to the plugin registered to handle that type. The rest is up to the plugin.
