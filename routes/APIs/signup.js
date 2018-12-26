var express = require('express');
var app = express();
var db = require('./db_functions.js');

//Just a test to run a query
app.post('/', function(req, res, next){

  /*Check if all requirements were sent*/
  if(Object.keys(req.body).length == 0){
    res.json({
      res : "Missing required fields",
      code : 400
    })
  }

  db.createUser(req.body.name, req.body.uname, req.body.psw, req.body.email, function(err, data){
    if(err){
      console.log("Database Error: ",err);
      res.json({
        code: 400,
        res: "Check console for error"
      });
    }
    else{
      res.json({
        code: 201,
        res: "New user created successfully"
      });

    }
  });
  // var query = "SELECT create_new_user($1, $2, $3, $4)";
  // var values = [req.body.name, req.body.uname, req.body.psw, req.body.email];

  // db.query(query, values, function(err, result){
  //   if(err){
  //     console.log(err.stack);
  //     res.json({
  //       res : "check console for error",
  //       code : 400
  //      });
  //   }
  //   else{
  //     res.set({
  //       res : "New user created successfully",
  //       code : 201
  //     });
  //     res.redirect('http://localhost:3000/login');
  //     // res.status(201);
  //     // res.redirect('http://localhost:3000/login');
  //   }
  // });
});

module.exports = app;

//EXAMPLES THAT MAY BE USEFUL
// const text = 'INSERT INTO users(name, email) VALUES($1, $2) RETURNING *'
// const values = ['brianc', 'brian.m.carlson@gmail.com']
//
// // callback
// client.query(text, values, (err, res) => {
//   if (err) {
//     console.log(err.stack)
//   } else {
//     console.log(res.rows[0])
//     // { name: 'brianc', email: 'brian.m.carlson@gmail.com' }
//   }
// })
