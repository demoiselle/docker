FROM ubuntu:16.10

MAINTAINER Demoiselle Framework <demoiselle.framework@gmail.com>

# Execute system update
RUN apt-get update && \
	apt-get install -y openjdk-8-jre git maven curl && \
	apt-get install -y ant && \
	apt-get clean;

RUN apt-get update && \
	apt-get install ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f;

# Set the working directory to jboss' user home directory
WORKDIR /opt/

# User root user to install software
USER root

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Expose the ports we're interested in
EXPOSE 8080
