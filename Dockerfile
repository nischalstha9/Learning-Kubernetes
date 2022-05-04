FROM python:3.8.3-alpine
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# install psycopg2 dependencies
RUN apk update
RUN apk add postgresql-dev python3-dev musl-dev build-base py-pip jpeg-dev zlib-dev 
RUN apk add curl bash

RUN apk add g++ libxslt-dev

WORKDIR /code
COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY . /code/