FROM alpine:edge
RUN	echo -e "https://mirrors.aliyun.com/alpine/edge/main\nhttps://mirrors.aliyun.com/alpine/edge/community" > /etc/apk/repositories && \
	apk update && \
	apk add tzdata && \
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	echo "Asia/Shanghai" > /etc/timezone
RUN apk add go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
RUN apk add git gcc libc-dev make
RUN apk add yasm && apk add ffmpeg
WORKDIR /go
