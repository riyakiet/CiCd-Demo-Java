FROM openjdk:11
COPY ./target/demo-0.0.1-SNAPSHOT.jar ./
EXPOSE 8083
CMD ['java' , '-jar']
