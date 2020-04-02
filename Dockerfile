FROM python:3-alpine

LABEL JIBSoft / JIB Digital Consult <https://www.jibdigitalconsult.com/>

RUN pip install speedtest-cli
RUN apk add curl

RUN mkdir -p /app/speedtest/
ADD scripts/ /
RUN chmod +x /RUN.sh

CMD sh -c /RUN.sh