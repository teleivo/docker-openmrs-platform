FROM tomcat:7-jre8-alpine

MAINTAINER teleivo

ENV OPENMRS_HOME="${CATALINA_HOME}/.OpenMRS"
ENV OPENMRS_MODULES="${OPENMRS_HOME}/modules"
ENV OPENMRS_PLATFORM_URL="http://mavenrepo.openmrs.org/nexus/service/local/repositories/releases/content/org/openmrs/web/openmrs-webapp/2.0.0/openmrs-webapp-2.0.0.war"
ENV DOCKERIZE_VERSION v0.2.0

RUN apk add --update curl

# Install dockerize
RUN curl -L "https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" -o "/tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" \
    && tar -C /usr/local/bin -xzvf "/tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz"

# Install openmrs
RUN curl -L ${OPENMRS_PLATFORM_URL} \
         -o ${CATALINA_HOME}/webapps/openmrs.war \
    && mkdir -p ${OPENMRS_MODULES}

ADD openmrs-runtime.properties.tmpl "${CATALINA_HOME}/openmrs-runtime.properties.tmpl"
ADD setenv.sh.tmpl "${CATALINA_HOME}/bin/setenv.sh.tmpl"

# Run openmrs using dockerize
CMD dockerize \
 -template "/usr/local/tomcat/bin/setenv.sh.tmpl:/usr/local/tomcat/bin/setenv.sh" \
 -template "/usr/local/tomcat/openmrs-runtime.properties.tmpl:/usr/local/tomcat/openmrs-runtime.properties" \
 -wait "tcp://${MYSQL_HOST}:${MYSQL_PORT}" \
 -timeout "${WAIT_SECONDS_FOR_MYSQL}s" \
 catalina.sh run
