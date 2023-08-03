# This container consists of two components:
#   /app/huawei_modbus_client.py - this connects to the inverter and retrieves watts
#   /app/huawei_pvoutput_upload.sh - this takes watts and uploads to pvoutput api
#

# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Populate timezone
RUN echo "Australia/Melbourne" > /etc/timezone
RUN cp /usr/share/zoneinfo/Australia/Melbourne /etc/localtime 

# Install python packages 
RUN pip install --trusted-host pypi.python.org pytz huawei-solar==0.0.3

# Install curl and cron
RUN apt-get update
RUN apt-get -y install cron curl

# Install the cron job to run every 5 mins
RUN crontab -l | { cat; echo "*/5 * * * * bash /app/huawei_pvoutput_upload.sh"; } | crontab -

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log

