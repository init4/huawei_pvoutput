## huawei_pvoutput
PVOutput.org uploader for WiFi based Huawei SUN2000 solar inverters

# Instructions

- Get the Huawei SUN2000 connected to your WiFI network. The instructions [here](https://solarcentral.com.au/huawei/) seem accurate
- Edit 'Dockerfile' to set the timezone for your location
- Edit 'huawei_modbus_client.py' to set the IP address of your inverter
- Edit 'huawei_pvoutput_upload.sh' to set your PVoutput.org system and API key
- Build the docker container with 'docker build -t huawei_pvoutput .'
- Run the docker container with 'docker run -d --restart always --name huawei_pvoutput huawei_pvoutput'
