FROM semagrow/semagrow

MAINTAINER Yiannis Mouchakis <gmouchakis@iit.demokritos.gr>


RUN cd / && \
    git clone https://github.com/semagrow/semagrow.git && \
    cd semagrow && \
    git checkout devel-bde && \
    mvn clean install -DskipTests && \
    cd / && \
    git clone https://github.com/semagrow/connector-cassandra.git && \
    cd connector-cassandra && \
    git checkout devel-bde && \
    mvn clean package && \
    mvn dependency:copy-dependencies && \
    cp target/*.jar $SEMAGROW_HOME/lib/semagrow/ && \
    cp target/dependency/*.jar $SEMAGROW_HOME/lib/semagrow/ && \
    cd / && \
    rm -r /semagrow && \
    rm -r /connector-cassandra

CMD cp_resources $SEMAGROW_HOME && catalina.sh run
 
