# Stage 1

FROM maven:latest as build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

# Stage 2

FROM tomcat:latest
COPY --from=build /home/app/target/Animals-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run]
