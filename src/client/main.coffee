Common = require('../common/common')
Client = require('./client')

window.start = () ->
	console.log 'start'
	new Common().foo()
	new Client().foo()