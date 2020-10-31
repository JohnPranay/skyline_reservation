FROM ubuntu:16.04
# set maintainer
LABEL maintainer "john.reddy1@wipro.com"
# set Working Directory
WORKDIR /opt/
# set/add resource
ADD jdk-11.0.2_linux-x64_bin.tar.gz /opt/
ADD apache-tomcat-8.5.27.tar.gz /opt/
ENV JAVA_HOME=/opt/jdk-11.0.2
ENV PATH $JAVA_HOME/bin:$PATH
#ADD AirlineReservation.war /opt/apache-tomcat-7.0.82/webapps/
#Expose Port
EXPOSE 12015 
CMD ["/opt/apache-tomcat-8.5.27/bin/catalina.sh" , "run"]

