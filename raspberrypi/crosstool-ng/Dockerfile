FROM debian:latest
MAINTAINER m0a <abe00makoto@gmail.com>
RUN apt-get update
RUN apt-get -y install build-essential vim emacs git \
  mercurial python3 python2.7 python-dev libzip-dev \
  automake libncurses5-dev gperf bison flex gawk \
  libtool libexpat-dev expat wget
RUN apt-get -y install texinfo
RUN mkdir /work
RUN chmod 777 /work
RUN useradd worker
USER worker
WORKDIR work
RUN wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.19.0.tar.bz2
RUN tar jxvf crosstool-ng-1.19.0.tar.bz2
WORKDIR crosstool-ng-1.19.0
RUN ./configure --prefix=/work
RUN make
RUN make install
ADD my_config /work/crosstool-ng-1.19.0/.config
RUN /work/bin/ct-ng build




# middleman routine
#WORKDIR work
#RUN mkdir /root/.ssh
#RUN chmod 700 /root/.ssh
#ADD ssh_config /root/.ssh/config
#RUN touch /root/.ssh/known_hosts
#RUN git clone https://github.com/DiscoverMeteor/DiscoverMeteorStatic.git
#WORKDIR DiscoverMeteorStatic
#RUN git submodule init
#RUN git submodule update --remote
#RUN bundle install
#ENV DMLANG ja
