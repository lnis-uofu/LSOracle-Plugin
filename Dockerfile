FROM openroad/debian-lsoracle
COPY --from=openroad/debian-yosys /yosys /yosys
RUN apt-get update && apt-get install -y --no-install-recommends make
ENV YOSYS_DIR=/yosys
ENV DEBIAN_FRONTEND=noninteractive
RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    apt-get update && \
    apt-get install -y gcc-8 g++-8 libreadline-dev zlib1g-dev && \
    apt-get clean
ENV CC=gcc-8 CXX=g++-8
RUN apt-get update && apt-get install -y libffi-dev
RUN mkdir /LSOracle-plugin && mv /LSOracle /LSOracle-plugin/LSOracle
COPY Makefile /LSOracle-plugin/Makefile
COPY oracle.cc /LSOracle-plugin/oracle.cc
RUN cd /LSOracle-plugin && make
