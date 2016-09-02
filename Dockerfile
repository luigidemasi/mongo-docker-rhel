FROM registry.access.redhat.com/rhel7/rhel

MAINTAINER Luigi De Masi <luigi.demasi@extrasys.it>

COPY mongodb-org-3.2.repo /etc/yum.repos.d/mongodb-org-3.2.repo

RUN yum -y update; yum clean all

RUN yum -y install mongodb-org; yum clean all

RUN mkdir -p /var/lib/mongo
RUN mkdir -p /var/run/mongodb
RUN mkdir -p /etc/mongod
RUN mkdir -p /var/log/mongodb

VOLUME /var/lib/mongo

COPY mongod.conf.yaml /etc/mongod/mongod.conf

EXPOSE 27017

ENTRYPOINT ["/usr/bin/mongod","-f", "/etc/mongod/mongod.conf"]


