import requests
import json

# API endpoint
url = ""

# API token
headers = {
    "Authorization": "",
    "Content-Type": "application/json",
}

# SLO payload
slo_payload = {
    "evaluationType": "AGGREGATE",
    "filter": "type(\"SERVICE\")",
    "metricExpression": "(100)*(builtin:service.errors.server.successCount:splitBy())/(builtin:service.requestCount.server:splitBy())",
    "metricName": "api_service_availability",
    "name": "API Service Availability",
    "target": 95,
    "timeframe": "-1d",
    "warning": 97.5
}

# Make the API request
response = requests.post(url, headers=headers, data=json.dumps(slo_payload))

# Check the response
if response.status_code == 201:
    print("SLO created successfully")
else:
    print(f"Failed to create SLO. Status code: {response.status_code}")
    print(response.text)
