import requests
import json
import tempfile

url = 'http://localhost:3000'

f = tempfile.NamedTemporaryFile(suffix=".txt")
f.write(b'This is a test fail.\nYou may delete this if it was not deleted on its own')
file = {'file' : f}

response = requests.post(url + '/upload', files=file, verify=False).json()

if(response['res'] == "You did not upload a python file"):
    print("'UploadWrongFileTypeFailure' Test Successful")
else:
    print("'UploadWrongFileTypeFailure' Test Failure")

f.close()
