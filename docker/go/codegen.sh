#!/bin/bash

set -e

ROOT=/go/src/github.com/darma2/protobuf-golang
PROTO_PATH=${ROOT}/proto
OUTPUT_CODE_PATH=${ROOT}/gen/go

mkdir -p $OUTPUT_CODE_PATH

pwd

protoc-gen-go-grpc -version

protoc -I /protobuf/include \
  -I /go/src \
  --plugin protoc-gen-go=protoc-gen-go \
  --plugin protoc-gen-go-grpc=protoc-gen-go-grpc \
  --go-grpc_opt paths=source_relative \
  --go-grpc_out ${OUTPUT_CODE_PATH} \
  --go_opt paths=source_relative \
  --go_out ${OUTPUT_CODE_PATH} \
  ${PROTO_PATH}/todo/*.proto
  #$(find ${PROTO_PATH} -iname '*.proto')
