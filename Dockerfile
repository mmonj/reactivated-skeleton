FROM nikolaik/python-nodejs:python3.9-nodejs16-slim

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git -y

WORKDIR /app
COPY pyproject.toml .
COPY poetry.lock .

RUN python -m pip install poetry
# enable installing dependencies into the system's python environment
RUN poetry config virtualenvs.create false
RUN poetry install --no-root

# user 'pn' was created during nikolaik/python-nodejs's build step
USER pn

