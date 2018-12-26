# AgileProject

# Dependencies
`Multer` / `cors` / `postgres (pg)` / `ng-bootstrap` / `python requests` / `forever`

##### Verify that all packages are correct and run `npm install`
##### You will need to install python requests through the use of pip or some other package installer for python.  Please note that this is not a node module and you will need to run the python scripts on your own or make a batch file.

# How to Add Your Project
* ## If you are incorporating your angular project into this branch
  Simply take your `/src` directory and merge it with the branch's.

* ## If you are incorporating your express/API files to this branch
  Merge your files with the current inside `/routes/APIs/` and run.

# Setting up
Setting up is easy.

After making sure all files and components are inside the `src` folder, run `ng build`.

This will compile the angular project you have made into a single page application inside a new folder called `dist`.

Next, Install the 'forever' package and run `forever start app.js`.
(npm install forever)

Visit https://www.npmjs.com/package/forever for documentation.

This will start up express listening on port 3000 and serve the angular project when a request is made to view the site.

# Testing
Currently, we are using Protractor Testing to test for front-end.

Protractor is an end-to-end test framework for Angular and AngularJS applications. It is similar (pretty sure the same...) to Jasmine JS and most used for unit testing.

To install, simply follow the "Setting up" guide and you'll have it installed.

Inside protractor testing folder is two files:
* todo-spec.js (Where all the testing script goes)

* config.js (Runs todo-spec through command)
Note: config.js is basically set and doesn't need to be changed, unless you're testing on a different web browser.

To run the test, run these two commands on TWO DIFFERENT cmd window:
* webdriver-manager start (DO NOT close this cmd window, let it run in the background)

* protractor config.js (Open up a new cmd window, go to the folder and run this command)
The Chrome browser will fire up on its own and run the test you've scripted. After the test, it will close the browser on its own and output test results in your cmd where you ran "protractor config.js".

That's pretty much it for now! Happy testing.
### Note Please do not modify the .gitignore file and make sure yours is correct before pushing to your or any branch.
