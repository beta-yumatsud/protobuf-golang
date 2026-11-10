FROM golang:1.16

RUN apt-get update -y && apt-get install -y unzip

WORKDIR /protobuf
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.15.8/protoc-3.15.8-linux-x86_64.zip
RUN unzip protoc-3.15.8-linux-x86_64.zip
RUN ln -ns /protobuf/bin/protoc /usr/local/bin/protoc

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1

ENV PATH $PATH:${GOPATH}/bin

WORKDIR /go/src/github.com/darma2/protobuf-golang

ENTRYPOINT ["/go/src/github.com/darma2/protobuf-golang/docker/go/codegen.sh"]
