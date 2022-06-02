#FROM openjdk:11
#EXPOSE 8081
#ADD target/spring-boot-docker.jar spring-boot-docker.jar
#ENTRYPOINT ["java", "-jar", "/spring-boot-docker.jar"]

#**************************************************************


FROM tomcat:8.0.20-jre8
#Dummy text to text
COPY target/spring-boot-docker.jar /usr/local/tomcat/webapps/spring-boot-docker.jar

