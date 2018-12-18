FROM mono:latest
MAINTAINER Jérémie Tabet <dev@jeremie.tabet.rocks>

RUN apt-get update && apt-get install -y mono-xsp4
WORKDIR /var/www
EXPOSE 9000
ENTRYPOINT ["xsp4", "--port=9000", "--nonstop"]
