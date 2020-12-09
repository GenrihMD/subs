FROM golang:1.13-alpine

ARG POSTGRES_DB
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_PORT
ENV POSTGRES_DB $POSTGRES_DB
ENV POSTGRES_USER $POSTGRES_USER
ENV POSTGRES_PASSWORD $POSTGRES_PASSWORD
ENV POSTGRES_PORT $POSTGRES_PORT

WORKDIR /app

COPY ./server /app

RUN go mod download && go get github.com/githubnemo/CompileDaemon

ENTRYPOINT CompileDaemon --build="go build -o app" --command=./app