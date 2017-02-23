FROM semagrow/semagrow

MAINTAINER Yiannis Mouchakis <gmouchakis@iit.demokritos.gr>


RUN cd / && \
    git clone https://github.com/semagrow/semagrow.git && \
    cd semagrow && \
    mvn clean install && \
    cd / && \
    git clone https://github.com/semagrow/connector-cassandra.git && \
    cd connector-cassandra && \
    git checkout devel-bde && \
    mvn clean package && \
    mvn dependency:copy-dependencies && \
    unzip $SEMAGROW_HOME/domains/localhost/webapps/SemaGrow.war -d $SEMAGROW_HOME/domains/localhost/webapps/SemaGrow/ && \
    cp target/*.jar $SEMAGROW_HOME/domains/localhost/webapps/SemaGrow/WEB-INF/lib/ && \
    cp target/dependency/*.jar $SEMAGROW_HOME/domains/localhost/webapps/SemaGrow/WEB-INF/lib/ && \
    cd / && \
    rm -r /semagrow && \
    rm -r /connector-cassandra

CMD cp_resources $SEMAGROW_HOME && catalina.sh run
 
