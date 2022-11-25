FROM ubuntu:20.04

WORKDIR /opt/

COPY assets/apt-requirements.txt /opt/apt-requirements.txt

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq update && \
    xargs apt-get -q install -y < /opt/apt-requirements.txt
   
COPY assets/oclint-22.02-llvm-13.0.1-x86_64-linux-ubuntu-20.04.tar.gz /opt/

RUN tar xvzf ./oclint-22.02-llvm-13.0.1-x86_64-linux-ubuntu-20.04.tar.gz && \
    rm -f ./oclint-22.02-llvm-13.0.1-x86_64-linux-ubuntu-20.04.tar.gz

ENV PATH=/opt/oclint-22.02/bin:$PATH
COPY assets/include /mazoea/installation/include
COPY assets/run.sh /opt/run.sh

RUN g++ --version || true && \
    gcc --version || true && \
    oclint --version

ENTRYPOINT [ "/opt/run.sh" ]
