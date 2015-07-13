FROM debian:latest

MAINTAINER Juan Pedro Perez "jp.alcantara@geographica.gs"

# Environment
# ENV JAVA_HOME /usr/local/jdk1.7.0_75
ENV PASSPHRASE testphrase

RUN apt-get update && apt-get install -y openssh-server

# RUN ssh-keygen -f /root/.ssh/id_rsa -N ${PASSPHRASE}

# RUN ssh-add id_rsa

# # Copy assets
# WORKDIR ${JRE_HOME}
# ADD packages/jai-1_1_3-lib-linux-amd64-jre.bin ./
# ADD packages/jai_imageio-1_1-lib-linux-amd64-jre.bin ./
# ADD packages/UnlimitedJCEPolicyJDK7.zip ./lib/security/
# ADD packages/geoserver-2.6.2-war.zip ${CATALINA_HOME}/webapps/
# ADD packages/compile.sh /usr/local/

# # Do everything
# WORKDIR /usr/local/
# RUN chmod 777 compile.sh
# RUN ./compile.sh

# EXPOSE 8080
# EXPOSE 3333
# EXPOSE 62911

EXPOSE 22

