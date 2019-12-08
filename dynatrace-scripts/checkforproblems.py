import sys
import json
import requests

DT_URL="https://stg99002.live.dynatrace.com/"
DT_TOKEN="Ur8ti8_9SLWYpfXSTDNgH"

def main():
   endpoint = DT_URL + "api/v1/problem/status"
   get_param = {'Accept':'application/json; charset=utf-8', 'Authorization':'Api-Token {}'.format(DT_TOKEN)}
   config_post = requests.get(endpoint, headers = get_param)
   jsonObj = applications = json.loads(config_post.text)
   problem = jsonObj["result"]["totalOpenProblemsCount"]
   return problem

if __name__=="__main__":
    val = main()
    exit(val)
