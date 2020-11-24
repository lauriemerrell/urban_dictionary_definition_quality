import requests

response=requests.post("http://localhost:5000/v1/sentiment", json={"text":"horrible place"})
print(response)
print(response.json())