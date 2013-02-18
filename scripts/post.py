import requests,json

payload= { "_type" : "mytype" }

r = requests.post("http://localhost:3000/messages/testchannel/", data = json.dumps(payload))

print r.content

