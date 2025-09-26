FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

ENV CGO_ENABLED=0
RUN go build -ldflags="-w -s" -o tracker .

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/tracker .

CMD ["./tracker"]
