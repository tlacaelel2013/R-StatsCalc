var express = require('express'),
	path = require('path'),
	app = express()

// Express middleware for serving static files
//

app.use(express.static(path.join(__dirname, '/iOS')));
app.get('/', function(req, res) {
	res.redirect('R-StatsCalc/webR-0.0/index1b.html')
});
app.listen(8080)

