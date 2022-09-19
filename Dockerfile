FROM centos:latest
MAINTAINER rashid78631@gmail.com
RUN df -Th
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
 zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page272/evolve.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip evolve.zip
RUN cp -rvf evolve/* /var/www/html/
RUN rm -rf evolve evolve.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
