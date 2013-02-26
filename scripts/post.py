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
        'files': [
        {
           'url': "http://www.helsinki.fi/jarj/hyc/kuvat/EM2001/top10/Werner.jpg",
           'targetdir': "c:/werner.jpg"
        }
        ]
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

#addr = "http://localhost:3000"
url = addr + "/messages/testchannel/?clientid=tester"

print "POST",url
command = commands[int(sys.argv[1])]
r = requests.post(url, data = json.dumps(command), headers = headers)
print command
print r.content

