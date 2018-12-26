import requests
import json

url = 'http://localhost:3000'

params = {}
file = {}

response = requests.post(url + '/upload', files=file, verify=False).json()

if(response['res'] == "No file attached"):
    print("'UploadNoFileFailure Test Successful'")
else:
    print("'UploadNoFileFailure Test Failure'")
