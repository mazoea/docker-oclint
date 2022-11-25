FROM ubuntu:20.04

WORKDIR /opt/src/
   
COPY assets/oclint-22.02-llvm-13.0.1-x86_64-linux-ubuntu-20.04.tar.gz /opt/src/

RUN tar xvzf ./oclint-22.02-llvm-13.0.1-x86_64-linux-ubuntu-20.04.tar.gz && \
    cp -aR ./oclint-22.02/bin/* /usr/bin && \
    rm -f ./oclint-22.02-llvm-13.0.1-x86_64-linux-ubuntu-20.04.tar.gz

RUN oclint --version

ENTRYPOINT [ "oclint" ]
CMD [ "--version" ]
