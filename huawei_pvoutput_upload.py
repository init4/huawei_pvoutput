#!/opt/homebrew/bin/python3

import requests
import datetime
from huawei_solar import HuaweiSolar

try:
    # Initialize HuaweiSolar instance
    c = HuaweiSolar(host="10.0.0.59")
except Exception as e:
    print("Error initializing HuaweiSolar:", str(e))
    exit(1)

# Replace with your actual API key and system ID
apikey = "your_api_key_here"
id = "123456"

# Get current date and time
current_timestamp = datetime.datetime.now()
current_date = current_timestamp.strftime('%Y%m%d')
current_time = current_timestamp.strftime('%H:%M')

# Get interesting data from the HuaweiSolar instance
input_power = c.get("input_power")
grid_voltage = c.get("grid_voltage")
internal_temperature = c.get("internal_temperature")
daily_yield_energy = c.get("daily_yield_energy")

# Convert daily_yield_energy from kw/h to w/h
daily_yield_wh = daily_yield_energy.value * 1000 if daily_yield_energy else 0

url = "https://pvoutput.org/service/r2/addstatus.jsp"

data = {
    "d": current_date,
    "t": current_time,
    "v1": daily_yield_wh,
    "v2": input_power.value if input_power else 0,
    "v5": internal_temperature.value if internal_temperature else 0,
    "v6": grid_voltage.value if grid_voltage else 0
}

headers = {
    "X-Pvoutput-Apikey": apikey,
    "X-Pvoutput-SystemId": id
}

response = requests.post(url, data=data, headers=headers)

if response.status_code != 200:
    print("Error uploading data:", response.status_code)
    print("Data:", data)
