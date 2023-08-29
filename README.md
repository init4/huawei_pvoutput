# huawei_pvoutput
PVOutput.org uploader for WiFi based Huawei SUN2000 solar inverters

## Instructions

- Get the Huawei SUN2000 connected to your WiFI network. The instructions [here](https://solarcentral.com.au/huawei/) seem accurate
- Edit 'Dockerfile' to set the timezone for your location
- Edit 'huawei_pvoutput_upload.py' to set the IP of your inverter, your PVoutput.org system and API key
- Build the docker container with 'docker build -t huawei_pvoutput .'
- Run the docker container with 'docker run -d --restart always --name huawei_pvoutput huawei_pvoutput'

## Notes

- I am populating the PVOutput voltage & temperature with the grid AC voltage and internal inverter temperature values. Not sure if that is what those fields are intended for, but the documentation is a bit sparse

