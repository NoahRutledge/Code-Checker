var express = require('express');
var http = require('http');
var path = require('path');
var app = express();
var bodyParser = require('body-parser');
var cors = require('cors');

//REQUIRE API ROUTES
var upload = require('./routes/APIs/upload');
var signup = require('./routes/APIs/signup');
var assignment = require('./routes/APIs/assignment');
var deleteAssignment = require('./routes/APIs/deleteAssignment');
var updateAssignment = require('./routes/APIs/updateAssignment');


//app.use setup
app.use(express.static(path.join(__dirname, '/dist')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser());
app.use(cors());

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS');
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});


//API ROUTES
app.use('/upload', upload);
app.use('/signup', signup);
app.use('/assignment-view', assignment);
app.use('/deleteAssignment', deleteAssignment);
app.use('/updateAssignment', updateAssignment);

//script test
app.get('*', function(req, res, next) {
  res.sendFile(__dirname + '/dist/index.html');
});


const port = process.env.PORT || '3000';
app.set('port', port);
app.listen(port, () => console.log('Running on port 3000'));

module.exports = app;
