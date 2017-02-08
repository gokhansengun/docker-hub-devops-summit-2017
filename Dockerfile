FROM nginx:1.10

RUN apt-get update \
      && apt-get install -y gettext-base \
      && rm -rf /var/lib/apt/lists/*

COPY ./scripts/ /scripts/

COPY ./src/ /usr/share/nginx/html/

CMD exec /scripts/nginx-init.sh
