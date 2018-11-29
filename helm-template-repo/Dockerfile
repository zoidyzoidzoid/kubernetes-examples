FROM python:3-alpine

WORKDIR /usr/src/app
ADD requirements.txt /usr/src/app
ENV FLASK_APP=main.py
CMD ["flask", "run"]

