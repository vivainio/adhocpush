import requests,json

payload= { "_type" : "mytype" }

addr = "http://adhocpush.herokuapp.com"

url = addr + "/messages/testchannel/?clientid=tester"
print "GET",url
r = requests.get(url)
print "Getting"
print r.content

