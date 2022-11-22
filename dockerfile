# syntax=docker/dockerfile:1
FROM ubuntu:18.04

# install app dependencies
RUN apt-get update && apt-get install -y python3.7 python3-pip

COPY requirements.txt /tmp/
RUN pip3 install --requirement /tmp/requirements.txt
COPY . /tmp/


# install app
COPY sentiment_basic.py /

# final configuration
ENV FLASK_APP=sentiment_basic
EXPOSE 8000
CMD flask run --host 0.0.0.0 --port 8000