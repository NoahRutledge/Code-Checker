import requests
import json
import tempfile

url = 'http://localhost:3000'

f = tempfile.NamedTemporaryFile(suffix=".py")
f.write(b'This is a test fail.\nYou may delete this if it was not deleted on its own')
file = {'file' : f}

response = requests.post(url + '/upload', files=file, verify=False).json()

if(response['res'] == "Your file did not contain the necessary contents"):
    print("'UploadBadContentsFailure' Test Successful")
else:
    print("'UploadBadContentsFailure' Test Failure")

f.close()
