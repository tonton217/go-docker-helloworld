FROM golang:latest
LABEL maintainer="Anthony Jung <anthony.wonjay.jung@gmail.com>"

WORKDIR /app

COPY . .

RUN go build -o main .

CMD ["./main"]