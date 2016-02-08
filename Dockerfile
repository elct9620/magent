###
# Magent
#
# A Parse-like microservice
###

FROM alpine:3.3
MAINTAINER 蒼時弦也<docker@frost.tw>

COPY rootfs /

CMD ["magent"]
EXPOSE 80 443


