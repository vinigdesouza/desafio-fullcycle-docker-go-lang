FROM golang:1.24 AS builder
WORKDIR /app
COPY main.go .
RUN go build -o app -ldflags="-s -w" main.go


FROM scratch
WORKDIR /app
COPY --from=builder /app/app .
CMD ["/app/app"]
