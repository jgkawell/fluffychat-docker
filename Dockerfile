FROM docker.io/alpine:3 as builder
RUN apk add --no-cache wget
WORKDIR /app
RUN wget https://github.com/krille-chan/fluffychat/releases/download/v1.17.0/fluffychat-web.tar.gz
RUN tar -xvf fluffychat-web.tar.gz

FROM docker.io/nginx:alpine
RUN rm -rf /usr/share/nginx/html
COPY --from=builder /app/build/web /usr/share/nginx/html