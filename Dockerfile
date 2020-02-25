ARG BUILD_FROM
FROM $BUILD_FROM
ENV LANG C.UTF-8
RUN apk add --no-cache nodejs npm git
RUN git clone https://github.com/tsightler/ring-mqtt
WORKDIR /ring-mqtt
RUN npm install
WORKDIR /
COPY run.sh /
RUN chmod +x run.sh 
ENTRYPOINT [ "/run.sh" ]
