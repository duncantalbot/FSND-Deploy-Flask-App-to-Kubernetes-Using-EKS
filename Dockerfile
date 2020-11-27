#pull official base image
FROM python:stretch

LABEL maintainer='Duncan Talbot'
LABEL date='2020-11-27'
LABEL description='Image to build the backend service (Flask) for Udacity FSND project'

# set work directory
COPY . /app
WORKDIR /app

# set environment variables
ENV PYTHONUNBUFFERED 1 \
    PYTHONDONTWRITEBYTECODE 1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_NO_CACHE_DIR=off

# install dependencies
RUN pip3 install --upgrade pip
COPY ./requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]