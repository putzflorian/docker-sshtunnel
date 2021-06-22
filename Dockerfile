FROM alpine:3.14.0
LABEL maintainer="Florian Putz putzflorian@gmail.com"
RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && \
ssh \
$VERBOSE_LEVEL \
-L *:$LOCAL_PORT:$LOCAL_HOST:$REMOTE_PORT $TUNNEL_HOST \
-o StrictHostKeyChecking=no \
-N \
–f \
&& while true; do sleep 30; done;
EXPOSE 1-65535


