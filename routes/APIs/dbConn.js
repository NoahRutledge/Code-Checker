var {Pool, Client} = require('pg');

var client = new Client({
  user: 'towell_sensei',
  host: 'agile-project.cvkgfgp4hjks.us-east-2.rds.amazonaws.com',
  database: 'agiledb',
  password: 'pass',
  port: 5432,
});
client.connect();

module.exports = client;
