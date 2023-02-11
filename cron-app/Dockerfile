FROM node
WORKDIR /src
RUN apt-get update && \
    apt-get install -y cron

COPY . .
RUN crontab mycron

CMD cron -f && tail -f /var/log/cron.log