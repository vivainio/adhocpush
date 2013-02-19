import requests,json

payload= { "_type" : "mytype" }

r = requests.get("http://localhost:3000/messages/testchannel/?clientid=tester")
print "Getting"
print r.content

