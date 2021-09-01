FROM registry.cn-shanghai.aliyuncs.com/pigeonligh/build:golang-1.16-alpine as build

ENV GOPROXY https://goproxy.cn

WORKDIR /go/src/govanityurls
COPY . .

RUN go build

FROM registry.cn-shanghai.aliyuncs.com/pigeonligh/runtime:alpine-3.14

WORKDIR /workspace

COPY --from=build /go/src/govanityurls/govanityurls /go/src/govanityurls/*.html /go/src/govanityurls/vanity.yaml ./

EXPOSE 8080

ENTRYPOINT ["./govanityurls"]

