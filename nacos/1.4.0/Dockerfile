FROM openjdk:8u282-jre
RUN echo "Asia/Shanghai" > /etc/timezone
WORKDIR /root
RUN wget https://github.com/alibaba/nacos/releases/download/1.4.0/nacos-server-1.4.0.tar.gz && tar -xzvf nacos-server-1.4.0.tar.gz && rm nacos-server-1.4.0.tar.gz
#ADD conf /root/nacos/conf/
EXPOSE 8848
CMD ["java","-Xms256m", "-Xmx512m","-Xmn256m","-Dnacos.standalone=true","-jar","/root/nacos/target/nacos-server.jar","--spring.config.additional-location=file:/root/nacos/conf/,classpath:/,classpath:/config/,file:./,file:./config/","--server.max-http-header-size=524288"]
