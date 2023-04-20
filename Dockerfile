FROM golang:1.16.3-alpine3.13 AS builder
WORKDIR /app
COPY main.go .
RUN echo "module myapp" > go.mod && go build -o main .

FROM scratch
COPY --from=builder /app/main .
CMD ["/main"]