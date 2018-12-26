import requests
import json

url = 'http://localhost:3000'

params = {}

response = requests.post(url + '/signup', data=params, verify=False).json()

if(response['res'] == "Missing required fields"):
    print("'SignupNoParamsFailure' Test Successful")
else:
    print("'SignupNoParamsFailure' Test Failure")
