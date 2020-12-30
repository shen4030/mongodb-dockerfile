FROM centos

COPY ./mongodb-org-3.4.repo /etc/yum.repos.d/mongodb-org-3.4.repo

RUN yum update && yum -y install mongodb-org

COPY ./mongod.conf /etc/mongod.conf

RUN mkdir -p /data/db && chmod -R 755 /data/db

VOLUME ["/data/db"]

WORKDIR /data
   
CMD ["mongod"]

EXPOSE 27017