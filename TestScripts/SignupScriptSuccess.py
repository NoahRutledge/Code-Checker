import requests
import json

url = 'http://localhost:3000'

params = {
    'name': 'Noah',
    'uname': 'ScriptUser',
    'psw': 'ScriptPass',
    'email': 'Script@gmail'
}

response = requests.post(url + '/signup', data=params, verify=False).json()

if(response['res'] == "New user created successfully"):
    print("'SignupScriptSuccess' Test Successful")
else:
    print("'SignupScriptSuccess' Test Failure")
