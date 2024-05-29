FROM alpine:latest

# Latest releases available at https://github.com/aptible/supercronic/releases
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.29/supercronic-linux-arm \
    SUPERCRONIC=supercronic-linux-arm \
    SUPERCRONIC_SHA1SUM=75e065bf0909f920b06d5bd797c0e6b31e68b112

RUN adduser -h /home/./files -s /bin/false -D files

COPY run.sh /bin/run.sh
COPY cron /var/spool/cron/crontabs/root
RUN chmod +x /bin/run.sh

# install dependencies
RUN apk add --update --no-cache ca-certificates curl wget lftp ncftp \
# install supercronic
    && curl -fsSLO "$SUPERCRONIC_URL" \
    && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
    && chmod +x "$SUPERCRONIC" \
    && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
    && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic \
# remove unwanted deps & cleanup
    && apk del --purge ca-certificates curl \
    && rm -rf /tmp/* /var/cache/apk/*

VOLUME /home/files

CMD /usr/local/bin/supercronic -debug /var/spool/cron/crontabs/root
