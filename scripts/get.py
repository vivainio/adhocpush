import requests,json

payload= { "_type" : "mytype" }

r = requests.get("http://localhost:3000/messages/testchannel/")
print "Getting"
print r.content

