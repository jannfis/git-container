FROM docker.io/library/nginx:1.25-alpine
RUN mkdir -p /git
COPY nginx.conf /etc/nginx/nginx.conf
COPY 30-start-fcgiwrap /docker-entrypoint.d/30-startfcgiwrap.sh
RUN apk add bash git git-daemon fcgiwrap
WORKDIR /git
RUN git clone --bare https://github.com/argoproj/argocd-example-apps
WORKDIR /
