import requests,json

payload= { "_type" : "mytype" }

headers = {'Content-type': 'application/json' }

addr = "http://adhocpush.herokuapp.com"
#addr = "http://localhost:3000"
url = addr + "/messages/testchannel/?clientid=tester"

print "POST",url

r = requests.post(url, data = json.dumps(payload), headers = headers)

print r.content

