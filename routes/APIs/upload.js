var express = require('express');
var app = express();
var multer = require('multer');
var exec = require('child_process').exec;
var sys = require('sys');
var db = require('./db_functions.js');
var fs = require('fs');
function puts(error, stdout, stderr) { console.log(stdout); }


var fileStore = multer.memoryStorage({
  destination: function(req, file, cb){
    cb(null, '/upload');
  },
  filename: function(req, file, cb){
    cb(null, file.originalname);
  }
}); //REQUIRED TO USE .BUFFER()
var upload = multer({
    storage: fileStore
});

app.post('/', upload.single('file'),  function(req, res){
  //Checks for attached file
  if(!req.hasOwnProperty('file'))
  {
      res.json({res : "No file attached",
                code : 400});
  }
  else{
    //Upload to DB

    db.addSubmission(req.body.problemid, 1, req.file.buffer, req.file.originalname, 0, 1, function(err, result)  //result returns the submission id associated to file
    {
      if(err){
        console.log("Database Error: ",err);
        res.json({
          code: 400,
          res: "Check console for error"
        });
      }
      else{
        //retrieve id from added submission
        var id = result.rows[0].create_submission;
        //fetch filename and file data
        db.getSubmission(id, function(err, result){
          if(err){
            console.log("Database Error: ",err);
            res.json({
              code: 400,
              res: "Check console for error"
            });
          }
          else{
            //converts bytea to string and stores attributes into variables
            var contents = result.rows[0]['code'].toString('utf8');
            var nameJava = result.rows[0]['filename'];
            var name = nameJava.replace(".java", "");

            //make unique folder for compilation based on submissionid
            fs.mkdir(__dirname + "/../../upload/" + id);
            //create the .java file from code contents
            fs.writeFile(__dirname + "/../../upload/" + id + "/" + nameJava, contents, (err) =>{
              if(err){
                console.log(err);
              }
            });

            //pull input and output test cases
            db.getInput(req.body.problemid, function(err, result){
              if(err){
                console.log(err);
              }
              else{
                //if successful then grab output
                var inputs = result.rows[0].getinput;

                db.getOutput(req.body.problemid, function(err, result){
                  if(err){
                    console.log(err);
                  }
                  else{
                    var outputs = result.rows[0].getoutput;
                      exec("cd upload/" + id + " && javac " + nameJava + " && echo " + inputs + "| java "+ name, function(error, stdout, stderr){
                        if(stdout == outputs){
                          db.updateSubmission(id,100, function(err, result){
                            if(err){
                              console.log(err);
                            }
                            else{
                              console.log("Your grade is 100! Good job!");
                            }
                          });
                        }
                        else{
                          console.log("Your grade is 0! What are you doing?");
                        }
                      }).on('exit',function()
                      {
                        //if(i == inputs.length){
                          exec("cd upload/" + id + " && rm " + nameJava + " && rm " + name + ".class").on('exit', function()
                          {
                            fs.rmdir("upload/" + id, function(err){
                              if(err){
                                console.log(err);
                              }
                            });
                          });
                        //}
                      });
                    //}

                  }
                });
              }
            });
          }
        });
      }
    });
  }
});

module.exports = app;
