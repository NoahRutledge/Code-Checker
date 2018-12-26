var db = require("./dbConn.js");
module.exports = {
  getAssignments: function(callback){
    db.query("select problemid,name,description,input,output from get_problems()", callback, function(err, result){
      if(err)
        callback(err, null);
      else
        callback(null, result);
    });
  },

  createUser: function(name, username, password, email, callback){
    var values = [name, username, password, email];
    db.query("select create_new_user($1, $2, $3, $4)", values, function(err, result){
      if(err)
        callback(err, null);
      else
        callback(null, result);
    });
  },

  addSubmission: function(problemID, userID, code, filename, grade, classID, callback){
    var values = [problemID, userID, code, filename, grade, classID];
    db.query("select create_submission($1,$2,$3,$4,$5,$6)", values, function(err, result){
      if(err){
        callback(err, null);
      }
      else{
        callback(null, result);
      }
    });
  },

  getSubmission: function(submissionID, callback){
    db.query("select code, filename from get_submission("+submissionID+")", function(err, result){
      if(err){
        callback(err, null);
      }
      else{
        callback(null, result);
      }
    });
  },

  getGrade: function(submissionID, callback){
    db.query("SELECT grade FROM submission WHERE submissionid = " + submissionID, function(err,result){
      if(err){
        callback(err, null);
      }
      else{
        callback(null, result);
      }
  });
  },

  updateSubmission: function(submissionID, grade, callback){
    db.query("select update_grade(" + submissionID + ", " + grade + ")", function(err, result){
      if(err){
        callback(err, null);
      }
      else{
        callback(null, result);
      }
    });
  },

  createAssignment: function(name, description, input, output, callback) {
    var values = [name,description, input, output];
    db.query("select create_problem($1, $2, $3, $4)", values, function(err, result){
      if(err){
        callback(err, null);
      }
      else{
        callback(null, result);
      }

    });

  },

  updateAssignment: function(id, name, description, input, output, callback) {
    var values = [id,name,description, input, output];
    db.query("select update_problem($1, $2, $3, $4, $5)", values, function(err, result){
      if(err){
        callback(err, null);
      }
      else{
        callback(null, result);
      }
    });
  },

  deleteAssignment: function(problemid, callback) {
    db.query("select delete_problem(" + problemid + ")", function(err, result){
      if(err){
        callback(err, null);
      }
      else{
        callback(null, 1);
      }
    });
  },

  getInput: function(problemID, callback){
    db.query("select getinput("+problemID+")", function(err, result){
      if(err){
        callback(err, null);
      }
      else{
        callback(null, result);
      }
    });
  },

  getOutput: function(problemID, callback){
    db.query("select getoutput("+problemID+")", function(err, result){
      if(err){
        callback(err, null);
      }
      else{
        callback(null, result);
      }
    });
  }

}
