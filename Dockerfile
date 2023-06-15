FROM nikolaik/python-nodejs:python3.9-nodejs16-slim

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

ARG ENV_TYPE
RUN if [ "$ENV_TYPE" = "dev" ] ; then \
	apt-get update -y \
	&& apt-get install git -y \
	; fi

WORKDIR /app
COPY pyproject.toml .
COPY poetry.lock .

RUN python -m pip install poetry
# enable installing dependencies into the system's python environment
RUN poetry config virtualenvs.create false
RUN poetry install --no-root

# user 'pn' was created during nikolaik/python-nodejs's build step
USER pn

