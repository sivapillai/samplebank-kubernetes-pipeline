import sys
import json
import requests

def main():
   DT_URL = sys.argv[1]
   DT_TOKEN = sys.argv[2]
   endpoint = DT_URL + "api/v1/problem/status"
   get_param = {'Accept':'application/json; charset=utf-8', 'Authorization':'Api-Token {}'.format(DT_TOKEN)}
   config_post = requests.get(endpoint, headers = get_param)
   jsonObj = json.loads(config_post.text)
   problem = jsonObj["result"]["totalOpenProblemsCount"]
   return problem

if __name__=="__main__":
    val = main()
    exit(val)
