FROM nikolaik/python-nodejs:python3.9-nodejs16-slim

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git -y

WORKDIR /app
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

USER pn
