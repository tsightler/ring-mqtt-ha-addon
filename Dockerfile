FROM hassioaddons/base
ENV LANG C.UTF-8
COPY entrypoint.sh /
RUN (apk add --no-cache nodejs npm git || \
    (sed -i -e 's/dl-cdn/dl-3/g' /etc/apk/repositories && apk add --no-cache nodejs npm git) || \
    (sed -i -e 's/dl-3/dl-4/g' /etc/apk/repositories && apk add --no-cache nodejs npm git)) && \
    chmod +x run.sh && \
    git clone https://github.com/tsightler/ring-mqtt && \
    cd /ring-mqtt && \
    npm install
ENTRYPOINT [ "/entrypoint.sh" ]
