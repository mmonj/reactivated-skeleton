FROM python:3.9.17-slim

WORKDIR /app
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_16.x  | bash -
RUN apt-get install nodejs -y

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser
