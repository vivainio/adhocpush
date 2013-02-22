import requests,json

payload= { "_type" : "mytype" }

addr = "http://adhocpush.herokuapp.com"
#addr = "http://localhost:3000"

url = addr + "/messages/testchannel/?clientid=tester"
while 1:
	print "GET",url
	r = requests.get(url)
	print "Getting"
	print r.content

