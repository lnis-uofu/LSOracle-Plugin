FROM openroad/debian-lsoracle
COPY --from=openroad/yosys /yosys /yosys
ENV YOSYS_DIR=/yosys
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y libffi-dev
RUN mkdir /LSOracle-plugin && mv /LSOracle /LSOracle-plugin/LSOracle
COPY Makefile /LSOracle-plugin/Makefile
COPY oracle.cc /LSOracle-plugin/oracle.cc
RUN cd /LSOracle-plugin && make
