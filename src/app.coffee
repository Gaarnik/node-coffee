express = require('express')

app = express()

app.set('views', __dirname + '/public/views/')
app.use(express.static(__dirname + '/public/'))

Common = require('./public/common/common')
common = new Common()
common.foo()

Server = require('./server/server')
server = new Server()
server.foo()

app.get('/', (req, res) ->
	res.render('index.jade')
)

app.listen(3000)