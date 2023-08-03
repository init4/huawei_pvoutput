#!/bin/bash
#

apikey=your_api_key_here
id=123456
date=`date '+%Y%m%d'`
time=`date '+%H:%M'`
watts=`/app/huawei_modbus_client.py`

#echo "apikey: $apikey id: $id date: $date time: $time watts: $watts"
curl -s -o /dev/null -d "d=$date" -d "t=$time" -d "v2=$watts" -H "X-Pvoutput-Apikey: $apikey" -H "X-Pvoutput-SystemId: $id" https://pvoutput.org/service/r2/addstatus.jsp

