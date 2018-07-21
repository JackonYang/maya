FROM mongo:4.0.0


COPY restore.sh /restore.sh
RUN chmod 700 /restore.sh

ENTRYPOINT /restore.sh
