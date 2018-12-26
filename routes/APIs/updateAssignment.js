var express = require('express');
var app = express();
var db = require('./db_functions.js');

app.post('/', function(req, res, next){

  /*Check if all requirements were sent*/
  if(Object.keys(req.body).length == 0){
    res.json({
      res : "Missing required fields",
      code : 400
    });
  }

  db.updateAssignment(req.body.problemid, req.body.name, req.body.description, req.body.input, req.body.output, function(err, data){
    if(err){
      console.log("Database Error: ",err);
      res.json({
        code: 400,
        res: "Check console for error"
      });
    }
    else{
      res.redirect('/');
    }
  });


});

module.exports = app;
