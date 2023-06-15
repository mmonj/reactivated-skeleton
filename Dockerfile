FROM nikolaik/python-nodejs:python3.9-nodejs16-slim

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git -y

WORKDIR /app
COPY pyproject.toml .
COPY poetry.lock .

USER pn
RUN python -m pip install poetry
RUN poetry install --no-root

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

