# docker-semagrow-cassandra

This is the docker container for the SemaGrow engine extended to fedetate also a Cassandra store. For more info about SemaGrow check https://github.com/semagrow/semagrow

To build docker-semagrow-cassandra go into the docker-semagrow-cassandra directory and run

    docker build -t semagrow-cassandra .

To run it 

    docker run -p <host_port>:8080 semagrow-cassandra

Then you can access it from 

    http://localhost:<host_port>/SemaGrow/

SemaGrow configuration files are located at

    /etc/default/semagrow

to add external configuration files run semagrow as

    docker run -p <host_port>:8080 -v <local_dir>:/etc/default/semagrow semagrow-cassandra
