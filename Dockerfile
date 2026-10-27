# syntax=docker/dockerfile:1.4

FROM python:latest
EXPOSE 8000
WORKDIR /app

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends --only-upgrade ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app
RUN pip3 install --upgrade "pip>=26.2.2" \
    && pip3 install -r requirements.txt --no-cache-dir
COPY . /app
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
