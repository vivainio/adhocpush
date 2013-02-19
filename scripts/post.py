import requests,json

payload= { "_type" : "mytype" }

headers = {'Content-type': 'application/json' }

r = requests.post("http://localhost:3000/messages/testchannel/", data = json.dumps(payload), headers = headers)

print r.content

