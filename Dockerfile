# Build: docker build -t helloworldweb .
#         && docker images
# Run: docker run -p 8080:8080 helloworldweb // docker run -p <host-port>:<container-port> <image-name>
# Test: curl http://localhost:8080

# Use golang-based image for container; golang version 1.12.4
FROM golang:1.16-alpine as build_base
RUN apk add --no-cache git

# Enable go modules for downloading dependencies
ENV GO111MODULE=on

# Set working directory in container
WORKDIR /tmp/app

# Copy webserver go file in local computer to container
COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

# Unit tests
RUN CGO_ENABLED=0 go test -v ./gowebservice

# Build the Go app
RUN go build -o ./out/helloworldweb .

## Second stage 
FROM alpine
RUN apk add ca-certificates


COPY --from=build_base /tmp/app/out/helloworldweb /app/helloworldweb

# Expose listening port for application
EXPOSE 8080

# Run the application
CMD ["/app/helloworldweb"]