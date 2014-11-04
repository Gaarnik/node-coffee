http = require('http')

onRequest = (req, res) ->
	res.writeHead(200, {'Content-Type': 'text/plain'})
	res.end('Hello CoffeeScript World\n')

http.createServer(onRequest).listen(1337, '127.0.0.1')