FROM golang:latest as builder
LABEL maintainer="Anthony Jung <anthony.wonjay.jung@gmail.com>"

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build  -a -installsuffix cgo -o main .

FROM alpine:latest

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /app/main .

CMD ["./main"]