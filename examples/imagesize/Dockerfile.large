FROM alpine:3.3

RUN dd if=/dev/zero of=/largefile bs=4k count=10000

RUN rm /largefile
