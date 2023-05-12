FROM golang:1.19-alpine as builder

WORKDIR /app

COPY main.go go.mod ./
RUN go build

FROM scratch

COPY --from=builder /app/nlevee /main

ENTRYPOINT ["/main"]