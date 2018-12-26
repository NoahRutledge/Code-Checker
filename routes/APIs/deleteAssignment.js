var express = require('express');
var app = express();
var db = require('./db_functions.js');

app.post('/', function(req, res){
    db.deleteAssignment(req.body.problemid, function(err, result){
        console.log(req.body);
        if(err){
            console.log(err);
            res.json({
                code: 400,
                res: "Could not delete assignment"
            });
        }
        else{
            res.redirect('/');
        }
    });
});

module.exports = app;
