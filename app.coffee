express = require('express')

app = express()

app.set('views', __dirname + '/views')
app.use(express.static(__dirname + '/../client'))

app.get('/', (req, res) ->
  res.render('index.jade')
)

app.listen(3000)