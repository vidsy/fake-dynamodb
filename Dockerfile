FROM java:8
LABEL maintainer="Vidsy <tech@vidsy.co>"

ARG VERSION
LABEL version=$VERSION

RUN apt-get update

RUN apt-get install -y curl
RUN mkdir -p /var/data/local-dynamo/data
RUN curl https://s3.eu-central-1.amazonaws.com/dynamodb-local-frankfurt/dynamodb_local_latest.tar.gz -L -O
RUN tar -zxvf dynamodb_local_latest.tar.gz -C /var/data/local-dynamo

EXPOSE 6001

ENTRYPOINT ["java"]
CMD ["-Djava.library.path=/var/data/local-dynamo/DynamoDBLocal_lib", "-jar", "/var/data/local-dynamo/DynamoDBLocal.jar", "-port", "6001", "-sharedDb"]
