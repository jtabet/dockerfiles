FROM mono:latest
MAINTAINER Jérémie Tabet <dev@jeremie.tabet.rocks>

RUN apt-get update && apt-get install -y mono-xsp4
