# Stage-1
FROM golang:1.16 as builder
COPY ./main.go ./
RUN go build -o /gitops-go-app ./main.go

# Satge-2
FROM ubuntu
EXPOSE 8080
COPY --from=builder /gitops-go-app /.
ENTRYPOINT ["./gitops-go-app"]
