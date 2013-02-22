import requests,json, sys

commands = [
#launch_url = 0
 {
    '_type': 'launch_url',
    'client': "asha_311_rd",
    'args' : {
        'url' : 'http://google.com'
    }
},

#find_files = 1
{
    '_type' : 'find_files',
    'request_cookie': "decafbad",
    'args' : {
        'rootdir' : "c:/",

    }
},

#download_files = 2
 {
    '_type': 'download_files',
    'args': {
        'files': {
           'url': "http://download.pics.com/lolcat.png",
            'targetdir': "c:/lolcat.png"
        }
    }

},

#upload_files = 3
{
    '_type': "upload_files",
    'request_cookie': "decafbad",
    'args': {
        'files': ["c:/lolcat.png"]

    }
}]

headers = {'Content-type': 'application/json' }

addr = "http://adhocpush.herokuapp.com"
url = addr + "/messages/testchannel/?clientid=tester"

print "POST",url

r = requests.post(url, data = json.dumps(commands[int(sys.argv[1])]), headers = headers)

print r.content

