# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD ./huawei_pvoutput_upload.py /app

# Populate timezone
RUN echo "Australia/Melbourne" > /etc/timezone
RUN cp /usr/share/zoneinfo/Australia/Melbourne /etc/localtime 

# Install python packages 
RUN pip install --trusted-host pypi.python.org pytz requests huawei-solar==0.0.3

# Install curl and cron
RUN apt-get update
RUN apt-get -y install cron 

# Install the cron job to run every 5 mins
RUN crontab -l | { cat; echo "*/5 * * * * /usr/local/bin/python3 /app/huawei_pvoutput_upload.py"; } | crontab -

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
