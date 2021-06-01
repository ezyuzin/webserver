FROM alpine:3.12

RUN apk update -f && \
  apk --no-cache add -f bash fcgi openssl openssh-client coreutils bind-tools curl socat tzdata oath-toolkit-oathtool tar && \
  rm -rf /var/cache/apk/*

ENV LE_HOME /acme
ENV LE_CONFIG_HOME $LE_HOME/data
ENV LE_CERT_HOME $LE_HOME/certs
ENV LE_LOG_HOME /var/log/acme
ENV LE_WWW_ROOT $LE_HOME/www
ENV AUTO_UPGRADE 1
ENV PS1="\u@acme.sh:\w> "

ADD ./install_acme/ /install_acme.sh/
RUN cd /install_acme.sh && \
  ./acme.sh \
    --install \
    --nocron \
    --home $LE_HOME \
    --config-home $LE_CONFIG_HOME \
    --cert-home $LE_CERT_HOME

RUN rm -rf /install_acme.sh/
RUN ln -s $LE_HOME/acme.sh  /usr/local/bin/acme.sh
RUN mkdir -p $LE_LOG_HOME

COPY ./lib /acme

# schedule cron task for autorenew certificates everyday at 01:00 AM
RUN crontab -l | { \
  cat; \
  #     min   hour    day     month   weekday command \
  echo "0     1       *       *       *       bash -l -c $LE_HOME/renew_all.sh >> $LE_LOG_HOME/renew.log"; \
} | crontab -

COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

CMD sh /startup.sh
